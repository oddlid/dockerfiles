#!/usr/bin/env bash
set -eux
# Setup stuff that should be run as root

declare -r arch=$(dpkg --print-architecture)

cd /tmp || exit 1

setup_nvim() {
	# https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
	[[ -n "${NVIM_VERSION}" ]] || return 1

	if [[ "${arch}" != "amd64" ]]; then
		echo "NeoVim is not available for ${arch}"
		return 2
	fi

	declare -r filename="nvim.appimage"
	declare -r baseurl="https://github.com/neovim/neovim/releases/download"
	declare -r url="${baseurl}/v${NVIM_VERSION}/${filename}"

	curl -LO "$url" \
	&& chmod 755 "$filename" \
	&& ./"$filename" --appimage-extract 1>&2 2>/dev/null \
	&& rm -f "$filename" \
	&& mv -f ./squashfs-root /usr/local/nvim-squashfs-root 1>&2 2>/dev/null \
	&& ln -s /usr/local/nvim-squashfs-root/AppRun /usr/local/bin/nvim
}

setup_bat() {
	# https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
	[[ -n "${BAT_VERSION}" ]] || return 1

	declare -r filename="bat_${BAT_VERSION}_${arch}.deb"
	declare -r baseurl="https://github.com/sharkdp/bat/releases/download"
	declare -r url="${baseurl}/v${BAT_VERSION}/${filename}"

	curl -LO "$url" \
	&& dpkg -i "$filename" \
	&& rm -f "$filename"
}

setup_ripgrep() {
	# https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
	[[ -n "${RIPGREP_VERSION}" ]] || return 1

	declare -r filename="ripgrep_${RIPGREP_VERSION}_${arch}.deb"
	declare -r baseurl="https://github.com/BurntSushi/ripgrep/releases/download"
	declare -r url="${baseurl}/${RIPGREP_VERSION}/${filename}"

	curl -LO "$url" \
	&& dpkg -i "$filename" \
	&& rm -f "$filename"
}

setup_git_delta() {
	# https://github.com/dandavison/delta/releases/download/0.11.3/git-delta_0.11.3_amd64.deb
	[[ -n "${GITDELTA_VERSION}" ]] || return 1

	declare -r filename="git-delta_${GITDELTA_VERSION}_${arch}.deb"
	declare -r baseurl="https://github.com/dandavison/delta/releases/download"
	declare -r url="${baseurl}/${GITDELTA_VERSION}/${filename}"

	curl -LO "$url" \
	&& dpkg -i "$filename" \
	&& rm -f "$filename"
}

setup_gitmux() {
	# https://github.com/arl/gitmux/releases/download/v0.7.6/gitmux_0.7.6_linux_amd64.tar.gz
	[[ -n "${GITMUX_VERSION}" ]] || return 1

	declare -r filename="gitmux_${GITMUX_VERSION}_linux_${arch}.tar.gz"
	declare -r baseurl="https://github.com/arl/gitmux/releases/download"
	declare -r url="${baseurl}/v${GITMUX_VERSION}/${filename}"

	curl -LO "$url" \
	&& tar -xf "$filename" \
	&& mv gitmux /usr/local/bin/ \
	&& rm -f "$filename"
}

setup_nodejs() {
	sh -c "curl -sL https://deb.nodesource.com/setup_16.x"
	apt-get update
	apt-get install -y --no-install-recommends yarn npm nodejs
}

setup_nvim || (echo "Failed to install NeoVim" && exit 1)
setup_bat || (echo "Failed to install bat" && exit 1)
setup_ripgrep || (echo "Failed to install ripgrep" && exit 1)
setup_git_delta || (echo "Failed to install git-delta" && exit 1)
setup_gitmux || (echo "Failed to install gitmux" && exit 1)
setup_nodejs || (echo "Failed to install nodejs" && exit 1)
