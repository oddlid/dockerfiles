FROM alpine:3.3
MAINTAINER Odd Eivind Ebbesen <oddebb@gmail.com>

#ENV GOSU_VERSION 1.9
ENV DUMBINIT_VERSION 1.1.2

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

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMBINIT_VERSION}/dumb-init_${DUMBINIT_VERSION}_amd64 \
	&& \
	chmod 755 /usr/local/bin/dumb-init \

COPY bitlbee.conf /etc/bitlbee/
COPY entrypoint.sh /

VOLUME ["/var/lib/bitlbee"]
EXPOSE 6667

ENTRYPOINT ["/usr/local/bin/dumb-init", "/entrypoint.sh"]
CMD ["/usr/sbin/bitlbee", "-n"]

