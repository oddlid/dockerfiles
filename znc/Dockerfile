FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV ZNC_VERSION 1.6.2

RUN apt-get update -qq --fix-missing \
	&& \
	apt-get install -y --no-install-recommends \
	build-essential \
	curl \
	libcurl4-openssl-dev \
	libperl-dev \
	libssl-dev \
	pkg-config \
	&& \
	apt-get clean autoclean \
	&& \
	apt-get autoremove -y \
	&& \
	rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/* \
	&& \
	mkdir -p /src

RUN cd /src \
	&& \
	curl -O http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz \
	&& \
	tar -zxf znc-${ZNC_VERSION}.tar.gz \
	&& \
	cd znc-${ZNC_VERSION} \
	&& \
	./configure --enable-perl \
	&& \
	make -j $(nproc) \
	&& \
	make -j $(nproc) install \
	&& \
	cd - \
	&& \
	rm -rf znc-${ZNC_VERSION}*

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64 \
	&& \
	chmod 755 /usr/local/bin/dumb-init \
	&& \
	curl -sL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
	&& \
	chmod 755 /usr/local/bin/gosu

RUN useradd -u 1000 -U znc
COPY start-znc /usr/local/bin/
COPY znc.conf.default /src/

EXPOSE 6664 6665 6666 6667
VOLUME ["/znc-data"]
CMD ["/usr/local/bin/dumb-init", "/usr/local/bin/start-znc"]

