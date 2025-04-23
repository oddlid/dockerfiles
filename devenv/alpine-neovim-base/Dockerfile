FROM alpine:edge
LABEL maintainer="Odd E. Ebbesen <git@oddware.net>"

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
  btop \
  bzip2 \
  bzip3 \
  coreutils \
  dog \
  drill \
  dtach \
  eza \
  fd \
  fzf \
  fzf-bash-plugin \
  fzf-neovim \
  fzf-tmux \
  fzf-vim \
  fzf-zsh-plugin \
  git \
  git-annex \
  git-annex-bash-completion \
  git-annex-zsh-completion \
  git-lfs \
  git-sizer \
  git-zsh-completion \
  gojq \
  gzip \
  htop \
  iproute2 \
  jq \
  lazygit \
  less \
  lf \
  mc \
  neomutt \
  neovim \
  nmap \
  notmuch \
  openssh \
  plzip \
  rclone \
  ripgrep \
  rsync \
  socat \
  sudo \
  tmux \
  tmux-zsh-completion \
  tzdata \
  unzip \
  urlview \
  vim \
  vimdiff \
  yq \
  zip \
  zsh \
  && rm -rf /var/cache/apk/*
