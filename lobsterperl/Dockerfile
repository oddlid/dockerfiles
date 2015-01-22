# "lobsterperl" - My anything-perl image for development/testing
FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV LANG C.UTF-8
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV PERL_CPANM_OPT --mirror http://ftp.acc.umu.se/mirror/CPAN/

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
		&& \
		apt-get -qq update \
		&& \
		apt-get -y --no-install-recommends install \
		build-essential \
		cpanminus \
		libcrypt-ssleay-perl \
		libnet-ssleay-perl \		
		libssl-dev \
		&& \
		apt-get clean autoclean \
		&& \
		apt-get autoremove -y \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN cpanm \
		DateTime \
		EV \
		IO::Socket::IP \
		IO::Socket::Socks \
		IO::Socket::SSL \
		Mojolicious

CMD ["bash"]
