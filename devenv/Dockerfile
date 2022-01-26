FROM docker.io/golang:latest
LABEL maintainer="Odd Eivind Ebbesen <oddebb@gmail.com>"

ARG ARG_TZ="Europe/Stockholm"
ARG DOCKER_USER="devenv"
ARG BAT_VERSION="0.19.0"
ARG GITDELTA_VERSION="0.11.3"
ARG GITMUX_VERSION="0.7.6"
ARG NVIM_VERSION="0.6.1"
ARG RIPGREP_VERSION="13.0.0"

ENV TZ=${ARG_TZ}
ENV DOCKER_USER=${DOCKER_USER}

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

COPY ./entrypoint.sh /
COPY ./system_setup.sh /tmp/
COPY ./user_setup.sh /tmp/

ENV BAT_VERSION=${BAT_VERSION}
ENV GITDELTA_VERSION=${GITDELTA_VERSION}
ENV GITMUX_VERSION=${GITMUX_VERSION}
ENV NVIM_VERSION=${NVIM_VERSION}
ENV RIPGREP_VERSION=${RIPGREP_VERSION}
# script should pick up all required env vars set above from args
RUN chmod 755 /tmp/*_setup.sh && /tmp/system_setup.sh

USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}

COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./dircolors .dircolors
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./tmux.conf .tmux.conf
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./init.vim .config/nvim/
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./init.vim .vimrc

RUN /tmp/user_setup.sh

USER root
ENTRYPOINT ["/entrypoint.sh"]


