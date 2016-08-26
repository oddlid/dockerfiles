# Dockerfile for an Arch instance with stuff I need without X

FROM dock0/service
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV PAGER /usr/bin/less
ENV EDITOR /usr/bin/vim
ENV VISUAL /usr/bin/vim
ENV LANG sv_SE.UTF-8
ENV REPORTTIME 5
ENV TIMEFMT %U user, %S system, %P cpu, %*Es total
ENV GOSU_VERSION 1.9
ENV TINI_VERSION 0.10.0

COPY mirrorlist /etc/pacman.d/mirrorlist
COPY locale.conf locale.gen vconsole.conf /etc/ 

RUN echo -e "[archlinuxfr]\nSigLevel = Optional\nServer = http://repo.archlinux.fr/\$arch" >>/etc/pacman.conf
RUN groupadd -g 1666 sudo
RUN useradd -G sudo oddee
RUN locale-gen
RUN pacman -Syy
RUN pacman -S --noconfirm --needed \
		arch-install-scripts \
		autoconf \
		automake \
		bash-completion \
		binutils \
		file \
		gcc \
		inetutils \
		lbzip2 \
		lesspipe \
		lsof \
		lzop \
		m4 \
		make \
		patch \
		pkg-config \
		rsync \
		screen \
		strace \
		sudo \
		tmux \
		unzip \
		whois \
		vim \
		vim-plugins \
		yaourt \
		zip \
		zsh \
		zsh-completions \
		&& \
		rm -rf /var/cache/pacman/pkg/*

RUN curl -sL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 \
	&& \
	chmod 755 /usr/local/bin/gosu
RUN curl -sL -o /usr/local/bin/tini https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static \
	&& \
	chmod 755 /usr/local/bin/tini
RUN curl -sL -o /usr/local/bin/tini-static.asc https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc \
	&& \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 \
	&& \
	gpg --verify /usr/local/bin/tini-static.asc /usr/local/bin/tini

# Have to do this _after_ installing yaourt
COPY yaourtrc /etc/

ENTRYPOINT ["/usr/local/bin/tini", "-g", "--"]
CMD ["/usr/bin/zsh"]


