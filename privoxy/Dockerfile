# carbonsphere/dock-privoxy with tini
FROM carbonsphere/dock-privoxy
MAINTAINER Odd E. Ebbesen

ENV TINI_VERSION 0.10.0

ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static /usr/local/bin/tini 
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc /usr/local/bin/tini-static.asc 
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 \
	&& \
	gpg --verify /usr/local/bin/tini-static.asc /usr/local/bin/tini \
	&& \
	chmod 755 /usr/local/bin/tini

ENTRYPOINT ["/usr/local/bin/tini", "-g", "--"]
CMD ["/usr/local/bin/run.sh"]
