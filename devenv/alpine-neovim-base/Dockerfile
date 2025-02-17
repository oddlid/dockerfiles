FROM alpine:edge
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

ARG ARG_TZ="Europe/Stockholm"
ENV TZ=${ARG_TZ}

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >>/etc/apk/repositories \
  && apk update \
  && apk add --no-cache --update \
  7zip \
  alpine-sdk \
  bash \
  bat \
  bc \
  bind-tools \
  bzip2 \
  bzip3 \
  coreutils \
  dog \
  drill \
  fd \
  fzf \
  git \
  git-zsh-completion \
  gojq \
  gzip \
  htop \
  iproute2 \
  less \
  neovim \
  nmap \
  openssh \
  plzip \
  ripgrep \
  rsync \
  socat \
  sudo \
  tmux \
  tmux-zsh-completion \
  tzdata \
  unzip \
  urlview \
  yq \
  zip \
  zsh \
  && rm -rf /var/cache/apk/*
