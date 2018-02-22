# Standard nginx with tini init

FROM nginx:alpine
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV TINI_VERSION 0.16.1

RUN apk add --no-cache gnupg && rm -rf /var/cache/apk/*

ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static /sbin/tini
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc /tmp/tini-static.asc
RUN gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7
RUN gpg --verify /tmp/tini-static.asc /sbin/tini
RUN chmod 755 /sbin/tini

ENTRYPOINT ["tini", "-g", "--"]
CMD ["nginx", "-g", "daemon off;"]
