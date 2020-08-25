FROM caddy:2.1.1-alpine
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

RUN addgroup -g 1000 caddy && adduser -u 1000 -G caddy -D caddy
RUN apk add --no-cache --update \
		libcap \
		tini \
		&& \
		rm -rf /var/cache/apk/*

RUN chown caddy:caddy /usr/bin/caddy && setcap cap_net_bind_service=+ep /usr/bin/caddy

USER caddy

ENTRYPOINT ["tini", "-g", "--"]
# Copied from parent Dockerfile
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

