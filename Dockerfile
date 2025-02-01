# Dockerfile zur Erstellung eines benutzerdefinierten Caddy-Images mit Cloudflare DNS-Plugin

# Stage 1: Build Caddy mit Cloudflare-Plugin
FROM caddy:builder AS builder

# Hinzufügen des Cloudflare DNS-Plugins zu Caddy
RUN xcaddy build \
    --with github.com/caddy-dns/infomaniak

# Stage 2: Verwende das offizielle Caddy-Image
FROM caddy:latest

# Kopiere das Caddy-Binary aus der Build-Phase
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
