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

## Flash it

Plug the board into this machine via **USB-C** (only — not the DIN 5V at the same
time), then:

```bash
cd esphome
./flash.sh              # pulls secrets from Infisical → flashes → shreds secrets.yaml
./flash.sh --render     # dry run: verify the Infisical pull works, no board needed
```

Pick the serial port when prompted. After the first flash, future updates go
**over-the-air** (Wi-Fi) — you rarely need USB again.

Validate the config itself (no board, no secrets):

```bash
esphome config golden-shower.yaml     # needs a secrets.yaml present; ./flash.sh --render covers the real check
```

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
