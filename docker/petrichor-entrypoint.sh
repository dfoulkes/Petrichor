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
#  Required environment (supplied by the workflow, never baked into the image):
#    INFISICAL_UNIVERSAL_AUTH_CLIENT_ID      machine identity client id
#    INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET  machine identity client secret
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

: "${INFISICAL_UNIVERSAL_AUTH_CLIENT_ID:?INFISICAL_UNIVERSAL_AUTH_CLIENT_ID is not set}"
: "${INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET:?INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET is not set}"
: "${INFISICAL_PROJECT_ID:?INFISICAL_PROJECT_ID is not set}"

INFISICAL_DOMAIN="${INFISICAL_DOMAIN:-https://infisical.foulkes.cloud/api}"
INFISICAL_ENV="${INFISICAL_ENV:-prod}"
INFISICAL_PATH="${INFISICAL_PATH:-/Petrichor}"

# The container may run as an arbitrary uid (-u $(id -u) in the workflow, so the
# build tree is not left root-owned in the runner workspace). That uid has no
# passwd entry and therefore no usable HOME, which both the Infisical CLI and
# PlatformIO need. Point it somewhere writable.
export HOME="${HOME:-/tmp/petrichor}"
mkdir -p "$HOME"

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

echo "==> Authenticating to Infisical (${INFISICAL_DOMAIN}) as a machine identity"
# --plain puts only the token on stdout; --silent suppresses the tip banner.
# Captured into a variable and exported: never echoed, never passed as a flag.
INFISICAL_TOKEN="$(
  infisical login \
    --method=universal-auth \
    --domain="${INFISICAL_DOMAIN}" \
    --plain --silent
)"
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
