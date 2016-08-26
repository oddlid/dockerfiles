FROM oddlid/debian-base:latest
MAINTAINER Odd Eivind Ebbesen <odd@oddware.net>

RUN apt-get update -qq \
		&& \
		apt-get install -y --no-install-recommends \
		gnutls-bin \
		openssl \
		python2.7 \
		&& \
		ln -sT /etc/ssl /usr/ssl \
		&& \
		ln -s /usr/bin/python2.7 /usr/bin/python \
		&& \
		useradd -m -u 1000 dropbox \
		&& \
		wget -nv -O /tmp/dropbox.tgz https://www.dropbox.com/download?plat=lnx.x86_64 \
		&& \
		tar -xzf /tmp/dropbox.tgz -C /usr/local \
		&& \
		mv /usr/local/.dropbox-dist /usr/local/dropbox-dist \
		&& \
		chown -R dropbox /usr/local/dropbox-dist \
		&& \
		ln -s /usr/local/dropbox-dist/dropboxd /usr/local/bin/ \
		&& \
		rm -f /tmp/dropbox.tgz \
		&& \
		wget -nv -O /usr/local/bin/dropbox-cli https://linux.dropbox.com/packages/dropbox.py \
		&& \
		chmod 755 /usr/local/bin/dropbox-cli \
		&& \
		apt-get clean autoclean \
		&& \
		apt-get autoremove -y \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/


VOLUME ["/home/dropbox/Dropbox"]
EXPOSE 17500
USER dropbox
CMD ["/usr/local/bin/dropboxd"]
