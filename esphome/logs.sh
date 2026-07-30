#!/usr/bin/env bash
# Stream the Petrichor logs, pulling secrets from Infisical at run time.
#
# Companion to flash.sh: golden-shower.yaml uses !secret, and flash.sh shreds
# secrets.yaml on exit, so plain `esphome logs` fails with "secret not defined".
# This renders a TEMPORARY secrets.yaml, attaches to the logs, then shreds it
# on exit — plaintext never persists in the repo.
#
# Prefer this over a raw serial terminal (picocom/screen): ESPHome sets the
# port up correctly, whereas raw terminals tend to toggle DTR/RTS and garble
# the ESP32's console.
#
# Usage:  ./logs.sh                     # serial logs over the default adapter
#         ./logs.sh --device /dev/ttyUSB0
#         ./logs.sh --device 192.168.51.5   # over the network (OTA/API) if reachable
set -euo pipefail
cd "$(dirname "$0")"

TOKEN_FILE="${INFISICAL_TOKEN_FILE:-$HOME/.config/infisical/token}"
PROJECT_ID="5c533f1a-81e8-41a2-b6f1-395887dfc391"
ENVIRONMENT="prod"
SECRET_PATH="%2FPetrichor"        # url-encoded /Petrichor
SECRETS_FILE="secrets.yaml"

[ -f "$TOKEN_FILE" ] || { echo "No Infisical token at $TOKEN_FILE" >&2; exit 1; }
TOKEN="$(cat "$TOKEN_FILE")"

# Always shred the rendered secrets on exit (success, failure, or Ctrl-C).
cleanup() { [ -f "$SECRETS_FILE" ] && { shred -u "$SECRETS_FILE" 2>/dev/null || rm -f "$SECRETS_FILE"; }; }
trap cleanup EXIT

echo "Pulling secrets from Infisical (${ENVIRONMENT} /Petrichor)…"
umask 077
curl -sk --fail \
  "https://infisical.foulkes.cloud/api/v3/secrets/raw?workspaceId=${PROJECT_ID}&environment=${ENVIRONMENT}&secretPath=${SECRET_PATH}" \
  -H "Authorization: Bearer ${TOKEN}" \
  | jq -er '.secrets[] | "\(.secretKey): \(.secretValue | @json)"' > "$SECRETS_FILE"

# Sanity: confirm the five keys the config needs actually rendered.
for k in wifi_base_station_name wifi_password ap_password ota_password api_encryption_key; do
  grep -q "^${k}:" "$SECRETS_FILE" || { echo "missing secret '${k}' — aborting" >&2; exit 1; }
done
echo "secrets.yaml rendered ($(grep -c ':' "$SECRETS_FILE") keys)."

echo "Attaching to golden-shower.yaml logs (Ctrl-C to exit)…"
esphome logs golden-shower.yaml "${@}"
# trap shreds secrets.yaml on the way out
