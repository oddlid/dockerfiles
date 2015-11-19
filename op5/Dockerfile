# An attempt at containerizing op5 Monitor
# Odd, 2014-11-03 14:05:59

FROM centos:centos6
MAINTAINER Odd E. Ebbesen

ENV OP5_VERSION 6.3.2

## Stuff that's needed for plugins etc
RUN yum install -y \
		epel-release \
		&& \
		yum install -y \
		automake \
		expat-devel \
		gcc \
		gcc-c++ \
		kernel-devel \
		libvirt \
		libxml2-devel \
		make \
		mysql-devel \
		ncurses-devel \
		perl-Crypt-SSLeay \
		perl-ExtUtils-MakeMaker \
		perl-Net-SSLeay \
		perl-Term-ReadLine-Gnu \
		perl-WWW-Curl \
		readline-devel \
		supervisor \
		tar \
		uuid-perl \
		which \
		wget \
		yum-plugin-versionlock

RUN wget -O - https://cpanmin.us | perl - App::cpanminus

RUN /usr/local/bin/cpanm \
		AnyEvent \
		EV \
		IO::Socket::SSL \
		JMX::Jmx4Perl \
		Linux::Inotify2 \
	    Digest::SHA \
		Mojolicious \
		Parallel::ForkManager \
		YAML

ADD op5-monitor-${OP5_VERSION}-20140827_rh-rpms-only.tar.gz /root/
ADD mods/install_${OP5_VERSION}.py /root/op5-monitor-${OP5_VERSION}/
WORKDIR /root/op5-monitor-${OP5_VERSION}
#RUN yum localinstall -y \
#		./rpm/centos/6/x86_64/nrpe-2.13.3-op5.1.x86_64.rpm \
#		&& \
#		yum versionlock add nrpe
RUN ./install_${OP5_VERSION}.py --noninteractive
# success this far...

# Make adjustments for the way we run op5 @ WirelessCar
# ADD mods/wcar_mods.sh /opt/monitor/
# RUN /opt/monitor/wcar_mods.sh

# Making volumes of all dirs what are written to and/or contains config
# /opt/monitor/etc
# /opt/monitor/op5/merlin/logs
# /opt/monitor/op5/merlin/binlogs
# /opt/monitor/op5/merlin/merlin.conf
# /opt/monitor/op5/merlin/ipc.sock

# /var/cache/merlin
# /var/run/op5
# /etc/op5

# WORKDIR /opt/monitor
