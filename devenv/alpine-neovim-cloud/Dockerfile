FROM oddlid/alpine-neovim-base:latest
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

RUN apk add --no-cache --update \
	ansible \
	dtach \
	git-annex \
	git-annex-bash-completion \
	git-annex-zsh-completion \
	git-lfs \
	git-sizer \
	go \
	gojq \
	helm \
	ijq \
	k9s \
	kubectl \
	nmap \
	npm \
	py3-pip \
	py3-pynvim \
	rust \
	shellcheck \
	socat \
	weechat \
	yarn \
	yq \
	&& rm -rf /var/cache/apk/*
