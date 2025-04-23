FROM oddlid/alpine-neovim-base:latest
LABEL maintainer="Odd E. Ebbesen <git@oddware.net>"

RUN apk add --no-cache --update \
  ansible \
  cargo \
  docker \
  go \
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
