FROM alpine:3.3
MAINTAINER Odd Eivind Ebbesen <oddebb@gmail.com>

RUN apk add --update \
	bash \
	bitlbee \
	bitlbee-otr \
	ca-certificates \
	curl \
	tini \
	&& \
	rm -rf /var/cache/apk/*

RUN addgroup bitlbee \
	&& \
	adduser -D -H -h /var/lib/bitlbee -s /bin/sh -G bitlbee bitlbee

COPY bitlbee.conf /etc/bitlbee/
COPY entrypoint.sh /

VOLUME ["/var/lib/bitlbee"]
EXPOSE 6667

ENTRYPOINT ["/sbin/tini", "-g", "--", "/entrypoint.sh"]
CMD ["/usr/sbin/bitlbee", "-n"]

