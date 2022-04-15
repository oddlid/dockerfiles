FROM ubuntu:rolling
LABEL maintainer="Odd Eivind Ebbesen <oddebb@gmail.com>"

ARG ARG_TZ="Europe/Stockholm"
ENV TZ=${ARG_TZ}

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ansible \
		git
