FROM alpine:3.2
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>
ENV LANG C.UTF-8
ENV LC_ALL C
COPY weechat.sh /usr/local/bin/
RUN addgroup -g 1000 wc && adduser -u 1000 -G wc -D wc
RUN apk add --update \
		bash \
		ca-certificates \
		curl \
		openssl \
		perl \
		python \
		tcl \
		weechat \
		wget \
		&& \
		rm -rf /var/cache/apk/*


ENTRYPOINT ["/usr/local/bin/weechat.sh"]
