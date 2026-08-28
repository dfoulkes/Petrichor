#!/usr/bin/env bash
# =============================================================================
#  Petrichor CI entrypoint — pull secrets from Infisical, then run ESPHome.
#
#  All credential handling lives here so the workflow YAML has none. Arguments
#  are passed straight through to esphome, e.g.
#
#      docker run ... petrichor-esphome:TAG config golden-shower.yaml
#      docker run ... petrichor-esphome:TAG compile golden-shower.yaml -s fw_version v0.1.2
#      docker run ... petrichor-esphome:TAG upload golden-shower.yaml --device IP --file BIN
#
#  Required environment (supplied by the workflow, never baked into the image).
#  Either an Infisical service token:
#    INFISICAL_TOKEN                         st.… read-only, scoped prod:/Petrichor
#  or a machine identity's Universal Auth pair:
#    INFISICAL_UNIVERSAL_AUTH_CLIENT_ID
#    INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET
#  Always:
#    INFISICAL_PROJECT_ID                    Infisical project (workspace) id
#  Optional:
#    INFISICAL_DOMAIN   default https://infisical.foulkes.cloud/api
#    INFISICAL_ENV      default prod
#    INFISICAL_PATH     default /Petrichor
#
#  Credentials arrive via environment, never argv, so nothing sensitive is
#  readable from `ps` — github_runner is a multi-tenant box that also hosts the
#  OpenClaw gateway and every other repo's runner.
# =============================================================================
set -euo pipefail
umask 077

: "${INFISICAL_PROJECT_ID:?INFISICAL_PROJECT_ID is not set}"

# Two ways in. INFISICAL_TOKEN is the CI path: a read-only service token
# scoped to prod:/Petrichor that never expires, so there is nothing to rotate.
# Universal Auth (a machine identity's client id + secret) is supported too —
# the CLI then mints its own short-lived token per run. Either works; the token
# is read from the environment, never passed as a flag, so it stays out of ps.
if [ -z "${INFISICAL_TOKEN:-}" ]; then
  : "${INFISICAL_UNIVERSAL_AUTH_CLIENT_ID:?set INFISICAL_UNIVERSAL_AUTH_CLIENT_ID, or supply INFISICAL_TOKEN}"
  : "${INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET:?set INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET, or supply INFISICAL_TOKEN}"
fi

INFISICAL_DOMAIN="${INFISICAL_DOMAIN:-https://infisical.foulkes.cloud/api}"
INFISICAL_ENV="${INFISICAL_ENV:-prod}"
INFISICAL_PATH="${INFISICAL_PATH:-/Petrichor}"

# The container runs as an arbitrary uid (-u $(id -u) in the workflow, so the
# build tree is not left root-owned in the runner workspace). That uid has no
# passwd entry, so Docker sets HOME=/ — which is NOT writable, and a plain
# ${HOME:-default} will not save you because HOME is set, just useless. ESPHome
# unpacks the ESP-IDF toolchain via XDG_CACHE_HOME and dies on /.cache without
# this. Point both at the persisted build cache so the multi-GB toolchain
# download survives between runs instead of being refetched every time.
export HOME="/config/.esphome/home"
export XDG_CACHE_HOME="/config/.esphome/cache"
mkdir -p "$HOME" "$XDG_CACHE_HOME"

# ESPHome resolves !secret relative to the config directory.
SECRETS="/config/secrets.yaml"

# Shred on ANY exit — success, failure, or cancellation. A cancelled Actions run
# sends SIGTERM, so plaintext must not be able to survive it.
cleanup() {
  if [ -f "$SECRETS" ]; then
    shred -u "$SECRETS" 2>/dev/null || rm -f "$SECRETS"
  fi
}
trap cleanup EXIT INT TERM

if [ -n "${INFISICAL_TOKEN:-}" ]; then
  echo "==> Using a pre-supplied INFISICAL_TOKEN (no login)"
else
  echo "==> Authenticating to Infisical (${INFISICAL_DOMAIN}) as a machine identity"
  # --plain puts only the token on stdout; --silent suppresses the tip banner.
  # Captured into a variable and exported: never echoed, never passed as a flag.
  INFISICAL_TOKEN="$(
    infisical login \
      --method=universal-auth \
      --domain="${INFISICAL_DOMAIN}" \
      --plain --silent
  )"
fi
export INFISICAL_TOKEN

echo "==> Rendering secrets.yaml from ${INFISICAL_ENV}:${INFISICAL_PATH}"
# --output-file rather than a shell redirect: secret values never transit a pipe
# that could end up echoed into a public Actions log.
infisical export \
  --domain="${INFISICAL_DOMAIN}" \
  --projectId="${INFISICAL_PROJECT_ID}" \
  --env="${INFISICAL_ENV}" \
  --path="${INFISICAL_PATH}" \
  --format=yaml \
  --silent \
  --output-file="${SECRETS}"

# Assert the five keys golden-shower.yaml actually needs. Without this a partial
# export fails much later as an opaque ESPHome schema error; flash.sh makes the
# same assertion for the same reason.
missing=()
for key in wifi_base_station_name wifi_password ap_password ota_password api_encryption_key; do
  grep -q "^${key}:" "${SECRETS}" || missing+=("${key}")
done
if [ ${#missing[@]} -gt 0 ]; then
  echo "::error::Infisical returned no value for: ${missing[*]}" >&2
  echo "         Check the machine identity can read ${INFISICAL_ENV}:${INFISICAL_PATH}" >&2
  exit 1
fi
echo "==> All five secrets present"

# NOT `exec` — exec replaces this shell and would destroy the cleanup trap,
# leaving plaintext secrets.yaml behind. Run as a child and forward signals so
# a cancelled workflow still shreds.
esphome "$@" &
child=$!
trap 'kill -TERM "${child}" 2>/dev/null || true' INT TERM
set +e
wait "${child}"
rc=$?
set -e
exit "${rc}"
