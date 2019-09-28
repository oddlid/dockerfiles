FROM frolvlad/alpine-glibc:latest
MAINTAINER Odd Eivind Ebbesen <odd@oddware.net>

ARG UID=1000
ARG GID=1000

RUN apk add --update --no-cache \
		ca-certificates \
		libstdc++ \
		openssl \
		python3 \
		shadow \
		su-exec \
		tini \
		wget \
		&& \
		addgroup -g ${GID} dropbox \
		&& \
		adduser -u ${UID} -G dropbox -D dropbox \
		&& \
		wget -nv -O /tmp/dropbox.tgz https://www.dropbox.com/download?plat=lnx.x86_64 \
		&& \
		tar -xzf /tmp/dropbox.tgz -C /usr/local \
		&& \
		mv /usr/local/.dropbox-dist /usr/local/dropbox-dist \
		&& \
		ln -s /usr/local/dropbox-dist/dropboxd /usr/local/bin/ \
		&& \
		rm -f /tmp/dropbox.tgz \
		&& \
		wget -nv -O /usr/local/bin/dropbox-cli https://linux.dropbox.com/packages/dropbox.py \
		&& \
		chmod 755 /usr/local/bin/dropbox-cli \
		&& \
		apk del wget \
		&& \
		rm -rf /var/cache/apk/*

VOLUME ["/home/dropbox/Dropbox"]
EXPOSE 17500
COPY startuphelper.sh /usr/local/sbin/
ENTRYPOINT ["tini", "-g", "--", "startuphelper.sh"]
CMD ["dropboxd"]
