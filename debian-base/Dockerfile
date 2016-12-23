FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV LANG C.UTF-8
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV GOSU_VERSION 1.10
ENV TINI_VERSION 0.13.2


RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
		&& \
		apt-get -qq update \
		&& \
		apt-get -y --no-install-recommends install \
		build-essential \
		ca-certificates \
		curl \
		wget \
		&& \
		apt-get clean autoclean \
		&& \
		apt-get autoremove -y \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN curl -sL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 \
	&& \
	chmod 755 /usr/local/bin/gosu 
RUN curl -sL -o /usr/local/bin/tini https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static \
	&& \
	chmod 755 /usr/local/bin/tini
RUN curl -sL -o /usr/local/bin/tini-static.asc https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc \
	&& \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 \
	&& \
	gpg --verify /usr/local/bin/tini-static.asc /usr/local/bin/tini

ENTRYPOINT ["/usr/local/bin/tini", "-g", "--"]
CMD ["/bin/bash"]
