FROM oddlid/debian-base:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

RUN apt-get -y --no-install-recommends install kpcli \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/sbin/tini", "-g", "--", "/entrypoint.sh"]

