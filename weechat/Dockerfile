FROM alpine:latest
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

ENV LANG C.UTF-8
ENV LC_ALL C

RUN apk add --update \
  ca-certificates \
  curl \
  openssl \
  weechat \
  weechat-matrix \
  weechat-perl \
  weechat-python \
  wget \
  && \
  rm -rf /var/cache/apk/*

RUN addgroup -g 1000 wc && adduser -u 1000 -G wc -D wc
CMD ["weechat"]
