FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV LANG C.UTF-8
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV GOSU_VERSION 1.9
ENV DUMBINIT_VERSION 1.1.2

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

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMBINIT_VERSION}/dumb-init_${DUMBINIT_VERSION}_amd64 \
	&& \
	chmod 755 /usr/local/bin/dumb-init \
	&& \
	curl -sL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 \
	&& \
	chmod 755 /usr/local/bin/gosu

CMD ["/usr/local/bin/dumb-init", "/bin/bash"]
