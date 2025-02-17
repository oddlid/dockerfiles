FROM golang:alpine AS builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build --with github.com/caddy-dns/cloudflare --output /go/bin/caddy

FROM caddy:latest
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

RUN apk add --no-cache --update tzdata && rm -rf /var/cache/apk/*
RUN addgroup -g 1000 caddy && adduser -u 1000 -G caddy -D caddy
COPY --chown=caddy:caddy --chmod=755 --from=builder /go/bin/caddy /usr/bin/caddy
RUN setcap cap_net_bind_service=+ep /usr/bin/caddy

USER caddy

# Copied from parent Dockerfile
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

