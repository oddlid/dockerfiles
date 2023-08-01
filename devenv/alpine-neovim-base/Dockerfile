FROM alpine:edge
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

ARG ARG_TZ="Europe/Stockholm"
ENV TZ=${ARG_TZ}

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >>/etc/apk/repositories \
	&& apk update \
	&& apk add --no-cache --update \
	alpine-sdk \
	bat \
	bc \
	coreutils \
	fd \
	fzf \
	git \
	git-zsh-completion \
	htop \
	less \
	neovim \
	openssh \
	plzip \
	ripgrep \
	the_silver_searcher \
	tmux \
	tmux-zsh-completion \
	tzdata \
	unzip \
	urlview \
	zsh \
	&& rm -rf /var/cache/apk/*
