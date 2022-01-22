FROM golang:latest
LABEL maintainer="Odd Eivind Ebbesen <oddebb@gmail.com>"

ARG ARG_DOCKER_USER="devenv"
ARG ARG_TZ="Europe/Stockholm"
# ARG RIPGREP_VERSION="13.0.0"
# ARG BAT_VERSION="0.19.0"
# ARG GITMUX_VERSION="0.7.5"
# ARG NVIM_VERSION="0.6.1"

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		fzf \
		gosu \
		silversearcher-ag \
		tmux \
		tmux-plugin-manager \
		zsh \
	; \
	rm -rf /var/lib/apt/lists/*

RUN addgroup "${ARG_DOCKER_USER}" && adduser "${ARG_DOCKER_USER}" -G "${ARG_DOCKER_USER}"
ENV DOCKER_USER=${DOCKER_USER}
ENV TZ=${ARG_TZ}

# fzf
# gosu
# silversearcher-ag
# tmux
# tmux-plugin-manager
# zsh

# https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
# https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
# https://github.com/arl/gitmux/releases/download/v0.7.5/gitmux_0.7.5_linux_amd64.tar.gz
# curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
# dpkg -i ripgrep_13.0.0_amd64.deb
