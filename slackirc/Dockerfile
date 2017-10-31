# Based on 1024/slackirc, but with tini
FROM alpine:latest
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

RUN apk add --update nodejs-current-npm tini \
	&& \
	rm -rf /var/cache/apk/*
RUN npm install -g slack-irc

ENV NODE_ENV development
ENV SLACK_LOG_LEVEL debug

ENTRYPOINT ["tini", "-g", "--"]
CMD ["slack-irc"]
