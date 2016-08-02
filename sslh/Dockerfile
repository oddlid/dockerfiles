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
ENV DUMBINIT_VERSION 1.1.2

ADD https://github.com/Yelp/dumb-init/releases/download/v${DUMBINIT_VERSION}/dumb-init_${DUMBINIT_VERSION}_amd64 /usr/local/bin/dumb-init
RUN chmod 755 /usr/local/bin/dumb-init

EXPOSE 443

CMD ["/usr/local/bin/dumb-init", "/usr/bin/sslh", "-f", "-u", "root", "-p", "${LISTEN_IP}:${LISTEN_PORT}", "--ssh", "${SSH_HOST}:${SSH_PORT}", "--ssl", "${HTTPS_HOST}:${HTTPS_PORT}", "--openvpn", "${OPENVPN_HOST}:${OPENVPN_PORT}"]
