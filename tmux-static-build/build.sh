#!/usr/bin/env bash

set -o errexit

MUSL_VERSION=1.2.3
LIBEVENT_VERSION=2.1.12
NCURSES_VERSION=6.3
TMUX_VERSION=3.3

TARGETDIR=$1
if [[ "${TARGETDIR}" = "" ]]; then
	TARGETDIR="${PWD}/out"
fi
mkdir -p "${TARGETDIR}"

TASKS=$(($(nproc) + 1))
CC=("${TARGETDIR}/bin/musl-gcc" -static)
_CFLAGS=( -Os -ffunction-sections -fdata-sections )
if "${REALGCC:-gcc}" -v 2>&1 | grep -q -- --enable-default-pie; then
  _CFLAGS+=( -no-pie )
fi
_LDFLAGS=("-Wl,--gc-sections" -flto)

_musl() {
	if [[ ! -e musl-${MUSL_VERSION}.tar.gz ]]; then
		curl -LO https://www.musl-libc.org/releases/musl-${MUSL_VERSION}.tar.gz
	fi
	tar zxf musl-${MUSL_VERSION}.tar.gz --skip-old-files
	pushd .
	cd musl-${MUSL_VERSION}
	CFLAGS="${_CFLAGS[*]}" LDFLAGS="${_LDFLAGS[*]}" ./configure --prefix="${TARGETDIR}" --disable-shared
	make -j $TASKS
	make install
	make clean
	popd
}

_libevent() {
	if [[ ! -e libevent-${LIBEVENT_VERSION}-stable.tar.gz ]]; then
		curl -LO https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}-stable/libevent-${LIBEVENT_VERSION}-stable.tar.gz
	fi
	tar zxf libevent-${LIBEVENT_VERSION}-stable.tar.gz --skip-old-files
	pushd .
	cd libevent-${LIBEVENT_VERSION}-stable
	_cflags=("${_CFLAGS[@]}" -flto)
	CC="${CC[*]}" CFLAGS="${_cflags[*]}" LDFLAGS="${_LDFLAGS[*]}" ./configure --prefix="${TARGETDIR}" --disable-shared --disable-openssl
	make -j $TASKS
	make install
	make clean
	popd
}

_ncurses() {
	if [[ ! -e ncurses-${NCURSES_VERSION}.tar.gz ]]; then
		curl -LO https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz
	fi
	tar zxvf ncurses-${NCURSES_VERSION}.tar.gz --skip-old-files
	pushd .
	cd ncurses-${NCURSES_VERSION}

	_cflags=("${_CFLAGS[@]}" -flto)
	CC="${CC[*]}" CFLAGS="${_cflags[*]}" LDFLAGS="${_LDFLAGS[*]}" ./configure --prefix $TARGETDIR \
		--with-default-terminfo-dir=/usr/share/terminfo \
		--with-terminfo-dirs="/etc/terminfo:/lib/terminfo:/usr/share/terminfo" \
		--enable-pc-files \
		--with-pkg-config-libdir="${TARGETDIR}/lib/pkgconfig" \
		--without-ada \
		--without-debug \
		--with-termlib \
		--without-cxx \
		--without-progs \
		--without-manpages \
		--disable-db-install \
		--without-tests
	make -j $TASKS
	make install
	make clean
	popd
}

_tmux() {
	if [[ ! -e tmux-${TMUX_VERSION}.tar.gz ]]; then
		curl -LO https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
	fi
	tar zxf tmux-${TMUX_VERSION}.tar.gz --skip-old-files
	pushd .
	cd tmux-${TMUX_VERSION}
	_cflags=("${_CFLAGS[@]}" -flto "-I${TARGETDIR}/include/ncurses/")
	CC="${CC[*]}" CFLAGS="${_cflags[*]}" LDFLAGS="${_LDFLAGS[*]}" PKG_CONFIG_PATH="${TARGETDIR}/lib/pkgconfig" ./configure --enable-static --prefix="${TARGETDIR}"
	make -j $TASKS
	make install
	make clean
	popd

	cp "${TARGETDIR}/bin/tmux" .
	strip --strip-all ./tmux
	if command -v upx &>/dev/null; then
		upx -k --best ./tmux
	fi
}

rm -rf "${TARGETDIR}/out"

if [[ ! -x "${TARGETDIR}/bin/musl-gcc" ]]; then
	_musl
fi

_libevent
_ncurses
_tmux
