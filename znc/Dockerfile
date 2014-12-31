FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV ZNC_VERSION 1.4

RUN ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
RUN useradd -u 1000 -U znc
COPY start-znc /usr/local/bin/
COPY znc.conf.default /src/

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
	rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

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

EXPOSE 6664 6665 6666 6667
VOLUME ["/znc-data"]
ENTRYPOINT ["/usr/local/bin/start-znc"]

