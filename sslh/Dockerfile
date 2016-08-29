FROM dock0/arch
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

RUN pacman -S --noconfirm --needed sslh \
		&& \
		rm -rf /var/cache/pacman/pkg/*

ENV LISTEN_IP 0.0.0.0
ENV LISTEN_PORT 443
ENV SSH_HOST localhost
ENV SSH_PORT 22
ENV OPENVPN_HOST localhost
ENV OPENVPN_PORT 1194
ENV HTTPS_HOST localhost
ENV HTTPS_PORT 8443
ENV TINI_VERSION 0.10.0

ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static /usr/local/bin/tini 
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc /usr/local/bin/tini-static.asc 
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 \
	&& \
	gpg --verify /usr/local/bin/tini-static.asc /usr/local/bin/tini \
	&& \
	chmod 755 /usr/local/bin/tini

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/tini", "-g", "--"]
CMD /usr/bin/sslh -f -u root -p ${LISTEN_IP}:${LISTEN_PORT} --ssh ${SSH_HOST}:${SSH_PORT} --ssl ${HTTPS_HOST}:${HTTPS_PORT} --openvpn ${OPENVPN_HOST}:${OPENVPN_PORT}
