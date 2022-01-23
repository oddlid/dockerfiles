FROM docker.io/golang:latest
LABEL maintainer="Odd Eivind Ebbesen <oddebb@gmail.com>"

ARG DOCKER_USER="devenv"
ARG DOCKER_USER_UID="1000"
ARG DOCKER_USER_GID="1000"
ARG ARG_TZ="Europe/Stockholm"
# ARG RIPGREP_VERSION="13.0.0"
# ARG BAT_VERSION="0.19.0"
# ARG GITMUX_VERSION="0.7.5"
ARG NVIM_VERSION="0.6.1"

ENV DOCKER_USER=${DOCKER_USER}
ENV TZ=${ARG_TZ}

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		fzf \
		gosu \
		silversearcher-ag \
		tmux \
		tmux-plugin-manager \
		vim \
		zsh \
	; \
	rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /usr/bin/zsh ${DOCKER_USER}

COPY entrypoint.sh /

USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}
COPY ./setup_oh_my_zsh.sh /tmp/
RUN /tmp/setup_oh_my_zsh.sh

COPY ./dircolors .dircolors
COPY ./tmux.conf .tmux.conf
COPY ./init.vim .config/nvim/
COPY ./setup.sh /tmp/
RUN NVIM_VERSION="${NVIM_VERSION}" /tmp/setup.sh

# this doesn't work, so need to set that from a shell init file for the user
# ENV PATH="${PATH}:${HOME}/bin"

USER root
ENTRYPOINT ["/entrypoint.sh"]


# https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
# https://github.com/arl/gitmux/releases/download/v0.7.5/gitmux_0.7.5_linux_amd64.tar.gz
# curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
# dpkg -i ripgrep_13.0.0_amd64.deb
# https://github.com/dandavison/delta/releases/download/0.11.3/git-delta_0.11.3_amd64.deb
