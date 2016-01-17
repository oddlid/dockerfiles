FROM oddlid/debian-base:latest
MAINTAINER Odd Eivind Ebbesen <oddebb@gmail.com>

RUN apt-get -qq update \
		&& \
		apt-get install -y --no-install-recommends \
		bitlbee \
		bitlbee-plugin-otr \
		gnutls-bin \
		libotr5-bin \
		&& \
		apt-get clean autoclean \
		&& \
		apt-get autoremove -y \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY entrypoint.sh /usr/local/bin/
VOLUME ["/etc/bitlbee", "/var/lib/bitlbee"]
EXPOSE 6667

ENTRYPOINT ["/usr/local/bin/dumb-init", "/usr/local/bin/entrypoint.sh"]
CMD ["bb"]
