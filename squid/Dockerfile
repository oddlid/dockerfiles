FROM sameersbn/squid:latest
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV TINI_VERSION 0.10.0
RUN curl -sL -o /sbin/tini https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static \
	&& \
	chmod 755 /sbin/tini \
	&& \
	curl -sL -o /tmp/tini-static.asc https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc \
	&& \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 \
	&& \
	gpg --verify /tmp/tini-static.asc /sbin/tini

ENTRYPOINT ["/sbin/tini", "-g", "--", "/sbin/entrypoint.sh"]

