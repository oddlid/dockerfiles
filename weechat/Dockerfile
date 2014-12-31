FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C

COPY weechat.sh /usr/local/bin/
RUN useradd -m -u 1000 -U wc
#RUN ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
RUN apt-get -qq update \
		&& \
		apt-get install -y --no-install-recommends \
		libnotify-bin \
		perl \
		python-potr \
		weechat \
		weechat-plugins \
		&& \
		apt-get clean autoclean \
		&& \
		apt-get autoremove -y \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/

VOLUME ["/home/wc/.weechat"]
ENTRYPOINT ["/usr/local/bin/weechat.sh"]
