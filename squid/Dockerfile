FROM sameersbn/squid:latest
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV TINI_VERSION 0.10.0

ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static /sbin/tini
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc /tmp/tini-static.asc

RUN chmod 755 /sbin/tini \
	&& \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 \
	&& \
	gpg --verify /tmp/tini-static.asc /sbin/tini

ENTRYPOINT ["/sbin/tini", "-g", "--", "/sbin/entrypoint.sh"]

