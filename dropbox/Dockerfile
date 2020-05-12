FROM oddlid/debian-base:stretch
LABEL maintainer="Odd Eivind Ebbesen <odd@oddware.net>"

ARG UID=1000
#ARG GID=1000

RUN apt-get update -qq \
		&& \
		apt-get install -y --force-yes --no-install-recommends \
		gnutls-bin \
		libglapi-mesa \
		libxcb-dri2-0 \
		libxcb-dri3-0 \
		libxcb-glx0 \
		libxcb-present0 \
		libxcb-sync1 \
		openssl \
		python2.7 \
		python-matplotlib \
		&& \
		ln -sT /etc/ssl /usr/ssl \
		&& \
		useradd -m -u ${UID} dropbox \
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
# Try to prevent automatic updates that kills the container
# See: https://wiki.archlinux.org/index.php/dropbox
RUN install -dm0 ~/.dropbox-dist
CMD ["dropboxd"]
