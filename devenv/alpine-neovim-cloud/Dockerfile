FROM oddlid/alpine-neovim-base:latest
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

RUN apk add --no-cache --update \
  ansible \
  cargo \
  docker \
  dtach \
  git-annex \
  git-annex-bash-completion \
  git-annex-zsh-completion \
  git-lfs \
  git-sizer \
  go \
  gomuks \
  helm \
  ijq \
  k9s \
  kubectl \
  npm \
  py3-pip \
  py3-pynvim \
  rust \
  shellcheck \
  weechat \
  yarn \
  && rm -rf /var/cache/apk/*
