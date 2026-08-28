#!/usr/bin/env bash
# =============================================================================
#  Petrichor firmware store — push/pull built firmware to MinIO on delphi.
#
#  Binaries live in the `petrichor` bucket rather than on the runner's disk:
#  github_runner is a 4 GB VM at ~86% full that also hosts the OpenClaw gateway
#  and 16 other repos' runners, so an unbounded pile of firmware images there is
#  a silent-failure waiting to happen.
#
#  Usage:
#    petrichor-store push <version> <local-file> [<local-file>…]
#    petrichor-store pull <version> <dest-dir>
#    petrichor-store list [<version>]
#
#  Object layout:  s3://<bucket>/firmware/<version>/<filename>
#
#  Credentials come from the same Infisical path as the ESPHome secrets, via
#  INFISICAL_TOKEN. MINIO_* never appear in this repo or in the workflow YAML.
# =============================================================================
set -euo pipefail
umask 077

: "${INFISICAL_PROJECT_ID:?INFISICAL_PROJECT_ID is not set}"
INFISICAL_DOMAIN="${INFISICAL_DOMAIN:-https://infisical.foulkes.cloud/api}"
INFISICAL_ENV="${INFISICAL_ENV:-prod}"
INFISICAL_PATH="${INFISICAL_PATH:-/Petrichor}"

# mc wants a writable HOME even when it never writes a config file.
export HOME="${HOME:-/tmp}"; [ -w "$HOME" ] || export HOME=/tmp

if [ -z "${INFISICAL_TOKEN:-}" ]; then
  : "${INFISICAL_UNIVERSAL_AUTH_CLIENT_ID:?set INFISICAL_UNIVERSAL_AUTH_CLIENT_ID, or supply INFISICAL_TOKEN}"
  : "${INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET:?set INFISICAL_UNIVERSAL_AUTH_CLIENT_SECRET, or supply INFISICAL_TOKEN}"
  INFISICAL_TOKEN="$(infisical login --method=universal-auth --domain="${INFISICAL_DOMAIN}" --plain --silent)"
  export INFISICAL_TOKEN
fi

# Pull MINIO_* into the environment. dotenv format so nothing is written to disk.
eval "$(
  infisical export \
    --domain="${INFISICAL_DOMAIN}" \
    --projectId="${INFISICAL_PROJECT_ID}" \
    --env="${INFISICAL_ENV}" \
    --path="${INFISICAL_PATH}" \
    --format=dotenv-export --silent \
  | grep -E '^export MINIO_(ENDPOINT|BUCKET|ACCESS_KEY|SECRET_KEY)='
)"

for v in MINIO_ENDPOINT MINIO_BUCKET MINIO_ACCESS_KEY MINIO_SECRET_KEY; do
  [ -n "${!v:-}" ] || { echo "::error::Infisical returned no value for ${v}" >&2; exit 1; }
done

# MC_HOST_<alias> keeps the credentials out of argv AND off disk — no
# `mc alias set`, so nothing lands in ~/.mc/config.json.
scheme="${MINIO_ENDPOINT%%://*}"
hostport="${MINIO_ENDPOINT#*://}"
export MC_HOST_petrichor="${scheme}://${MINIO_ACCESS_KEY}:${MINIO_SECRET_KEY}@${hostport}"

BASE="petrichor/${MINIO_BUCKET}/firmware"
cmd="${1:?usage: petrichor-store push|pull|list …}"; shift

case "$cmd" in
  push)
    version="${1:?push needs a version}"; shift
    [ $# -gt 0 ] || { echo "::error::push needs at least one file" >&2; exit 1; }
    for f in "$@"; do
      [ -f "$f" ] || { echo "::error::no such file: $f" >&2; exit 1; }
      echo "==> push $(basename "$f") -> s3://${MINIO_BUCKET}/firmware/${version}/"
      mc cp --quiet "$f" "${BASE}/${version}/$(basename "$f")"
    done
    mc ls "${BASE}/${version}/"
    ;;
  pull)
    version="${1:?pull needs a version}"
    dest="${2:?pull needs a destination directory}"
    mkdir -p "$dest"
    # Fail loudly rather than silently producing an empty directory.
    if ! mc ls "${BASE}/${version}/firmware.ota.bin" >/dev/null 2>&1; then
      echo "::error::no firmware stored for ${version} at s3://${MINIO_BUCKET}/firmware/${version}/" >&2
      exit 1
    fi
    echo "==> pull ${version} -> ${dest}"
    mc cp --quiet --recursive "${BASE}/${version}/" "${dest}/"
    ls -l "$dest"
    ;;
  list)
    if [ $# -gt 0 ]; then mc ls "${BASE}/$1/"; else mc ls "${BASE}/"; fi
    ;;
  *)
    echo "::error::unknown command '${cmd}' (expected push|pull|list)" >&2; exit 1
    ;;
esac
