# =============================================================================
#  Petrichor CI image — ESPHome + the Infisical CLI
#
#  Adds the Infisical CLI to the stock ESPHome image so credential retrieval
#  happens inside the container via a supported tool, not hand-rolled
#  curl | jq in the workflow. See docker/petrichor-entrypoint.sh.
#
#  This image contains NO credentials. It is built on the runner and never
#  pushed to a registry — there is one runner, so there is nothing to publish.
#
#  Build:
#    docker build -f docker/esphome-ci.Dockerfile \
#      --build-arg ESPHOME_VERSION=2026.7.0 \
#      --build-arg INFISICAL_CLI_VERSION=0.43.125 \
#      -t petrichor-esphome:2026.7.0-0.43.125 .
# =============================================================================
ARG ESPHOME_VERSION=2026.7.0
FROM ghcr.io/esphome/esphome:${ESPHOME_VERSION}

# Pinned like PROMTOOL_VERSION in dfoulkes/prometheus-setup: an upstream CLI
# release must never silently change how secrets reach a firmware build.
ARG INFISICAL_CLI_VERSION=0.43.125
ARG MC_VERSION=RELEASE.2025-08-13T08-35-41Z
ARG MC_SHA256=01f866e9c5f9b87c2b09116fa5d7c06695b106242d829a8bb32990c00312e891

# The official Infisical apt repo — the same one already installed on the
# runner host. The keyring is fetched and dearmored explicitly rather than
# piping setup.deb.sh into a shell, so what is trusted is visible here.
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl gnupg ca-certificates \
 && curl -fsSL https://artifacts-cli.infisical.com/infisical.gpg \
      | gpg --dearmor -o /usr/share/keyrings/infisical-archive-keyring.gpg \
 && printf 'deb [signed-by=/usr/share/keyrings/infisical-archive-keyring.gpg] %s\n' \
      'https://artifacts-cli.infisical.com/deb stable main' \
      > /etc/apt/sources.list.d/infisical.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends "infisical=${INFISICAL_CLI_VERSION}" \
 && apt-get purge -y --auto-remove gnupg \
 && rm -rf /var/lib/apt/lists/*

# The CLI phones home for update checks by default; a CI container has no
# business doing that, and it writes noise into a public build log.
# MinIO client, for shipping the built firmware to the petrichor bucket on
# delphi instead of filling the runner's disk. Pinned and checksum-verified —
# this binary handles credentials, so "curl | latest" is not good enough.
RUN curl -fsSL -o /usr/local/bin/mc \
      "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.${MC_VERSION}" \
 && echo "${MC_SHA256}  /usr/local/bin/mc" | sha256sum -c - \
 && chmod 0755 /usr/local/bin/mc

ENV INFISICAL_DISABLE_UPDATE_CHECK=true

COPY docker/petrichor-entrypoint.sh /usr/local/bin/petrichor
COPY docker/petrichor-store.sh      /usr/local/bin/petrichor-store
RUN chmod 0755 /usr/local/bin/petrichor /usr/local/bin/petrichor-store

ENTRYPOINT ["/usr/local/bin/petrichor"]
