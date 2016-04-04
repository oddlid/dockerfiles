FROM alpine:3.3
MAINTAINER Odd Eivind Ebbesen <oddebb@gmail.com>

RUN apk add --update \
	bash \
	bitlbee \
	bitlbee-otr \
	ca-certificates \
	curl \
	&& \
	rm -rf /var/cache/apk/*

RUN addgroup bitlbee \
	&& \
	adduser -D -H -h /var/lib/bitlbee -s /bin/sh -G bitlbee bitlbee

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64 \
	&& \
	chmod 755 /usr/local/bin/dumb-init

COPY bitlbee.conf /etc/bitlbee/
COPY entrypoint.sh /

VOLUME ["/var/lib/bitlbee"]
EXPOSE 6667

ENTRYPOINT ["/usr/local/bin/dumb-init", "/entrypoint.sh"]
CMD ["/usr/sbin/bitlbee", "-n"]

