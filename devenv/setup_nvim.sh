#!/usr/bin/env bash

# nvim seems to only be available for x86_64 on github, so I
# don't know if this will work with docker on M1...

[[ -n "${NVIM_VERSION}" ]] || exit 1

readonly filename="nvim.appimage"
readonly baseurl="https://github.com/neovim/neovim/releases/download"
readonly url="${baseurl}/v${NVIM_VERSION}/${filename}"

cd /tmp || exit 2
curl -LO $url
chmod 755 $filename
./${filename} --appimage-extract
# ...
