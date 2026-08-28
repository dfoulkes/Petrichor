# Petrichor — ESPHome firmware

Firmware for the ESP32 irrigation controller. Flashes onto the ELEGOO
ESP32-WROOM-32 (30-pin), drives the 8-channel opto relay, and appears in Home
Assistant as eight switches. Metrics (Wi-Fi signal, uptime, temperature) surface
in HA for scraping into Prometheus/Thanos.

## Secrets: Infisical is the source of truth

The five secrets this firmware needs live in **Infisical** — project `homelab`,
**prod** environment, folder **`/Petrichor`**:

```
wifi_base_station_name   wifi_password   ap_password   ota_password   api_encryption_key
```

You do **not** hand-maintain a `secrets.yaml`. `flash.sh` pulls these from Infisical
at flash time, renders a temporary `secrets.yaml`, flashes, then **shreds it** — so
plaintext never persists in the repo. (`secrets.yaml.example` is only a reference for
the expected key names / offline use.)

Auth mirrors `mysql-to-postgres-migration/scripts/infisical-get.sh`: a token at
`~/.config/infisical/token` (override with `$INFISICAL_TOKEN_FILE`).

### About `api_encryption_key`

It's a shared secret **you generate** (`openssl rand -base64 32`), not something Home
Assistant issues. It's stored in Infisical, baked into the firmware at flash time, and
you paste **the same value** into Home Assistant when you adopt the device.

## Flash it (first time, over USB)

The **first** flash is still by hand over USB — OTA needs firmware already on the
board. Plug the board into this machine via **USB-C** (only — not the DIN 5V at the
same time), then:

```bash
cd esphome
./flash.sh              # pulls secrets from Infisical → flashes → shreds secrets.yaml
./flash.sh --render     # dry run: verify the Infisical pull works, no board needed
```

Pick the serial port when prompted. `flash.sh` also stays the fallback for any time
CI or the network isn't an option.

Validate the config itself (no board, no secrets):

```bash
esphome config petrichor.yaml     # needs a secrets.yaml present; ./flash.sh --render covers the real check
```

## After that, CI delivers

Two GitHub Actions workflows on the self-hosted runner (`github_runner`) take over:

- **`.github/workflows/build-firmware.yml`** — fires on pushes to `main` that touch
  `esphome/**`. Lints (`esphome config`), compiles in a pinned container, stores the
  build on the runner at `/opt/petrichor-ci/firmware/<tag>/`, then tags the commit and
  cuts a GitHub Release. Versions start at `v0.1.1` and bump the third component each
  time (`v0.1.1` → `v0.1.2`). Also runnable by hand via `workflow_dispatch` with
  `dry_run: true` to lint + compile without tagging.
- **`.github/workflows/deploy-firmware.yml`** — manual only (`workflow_dispatch`),
  takes a `tag` input, and OTAs that exact stored build to the controller at
  `192.168.51.5`. Deploy is deliberately **never** automatic — this flashes a live
  irrigation controller.

CI pulls the same secrets from Infisical via an org-level **Machine Identity**
(Universal Auth), using the Infisical CLI baked into the build container. GitHub holds
only the machine identity's `INFISICAL_CLIENT_ID` and `INFISICAL_CLIENT_SECRET` — no
ESPHome credential is ever stored in GitHub. Infisical stays the single source of
truth, exactly as `flash.sh` uses it locally.

**The firmware binary is never published** — not as a workflow artifact, not as a
release asset. Petrichor is a public repo and an ESPHome binary has the Wi-Fi PSK and
API encryption key compiled into it. Builds stay on the runner.

The ESPHome version is pinned in the workflow (`ESPHOME_VERSION: 2026.7.0`), so an
upstream release can't silently change what gets flashed.

## Zone → GPIO → relay map

| Zone | GPIO | Relay IN | Zone | GPIO | Relay IN |
|------|------|----------|------|------|----------|
| 1 | GPIO13 | IN1 | 5 | GPIO19 | IN5 |
| 2 | GPIO16 | IN2 | 6 | GPIO21 | IN6 |
| 3 | GPIO17 | IN3 | 7 | GPIO22 | IN7 |
| 4 | GPIO18 | IN4 | 8 | GPIO23 | IN8 |

(Physical zone assignment — which corner rotor / the drip line — is finalised
once the flow/pressure test settles the zone count. Rename the switches then.)

## Safety behaviours baked in

- **Active-LOW relay handled** (`inverted: true`) — HA "on" = valve open.
- **Fail dry:** `restore_mode: ALWAYS_OFF` (every boot lands all-off) and
  `api reboot_timeout: 5min` (lose HA → reboot → valves shut).
- **One zone at a time:** shared `interlock` (single-tap water budget).
- **Anti-flood backstop:** each valve force-closes after `max_run` (20 min).

See the wiring diagram at `../docs/wiring-diagram.html`.
