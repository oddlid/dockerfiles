FROM alpine:3.3
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>
ENV LANG C.UTF-8
ENV LC_ALL C
RUN addgroup -g 1000 wc && adduser -u 1000 -G wc -D wc
RUN apk add --update \
		bash \
		ca-certificates \
		curl \
		openssl \
		perl \
		python \
		sudo \
		tcl \
		weechat \
		wget \
		&& \
		rm -rf /var/cache/apk/*

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64 \
		&& \
		chmod 755 /usr/local/bin/dumb-init \
		&& \
		curl -sL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
		&& \
		chmod 755 /usr/local/bin/gosu

COPY weechat.sh /usr/local/bin/
CMD ["/usr/local/bin/dumb-init", "/usr/local/bin/weechat.sh"]
