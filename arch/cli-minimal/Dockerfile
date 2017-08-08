# Dockerfile for an Arch instance with stuff I need without X

FROM dock0/service
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV PAGER /usr/bin/less
ENV EDITOR /usr/bin/vim
ENV VISUAL /usr/bin/vim
ENV LANG sv_SE.UTF-8
ENV REPORTTIME 5
ENV TIMEFMT %U user, %S system, %P cpu, %*Es total
ENV GOSU_VERSION 1.10
ENV TINI_VERSION 0.15.0

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
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static /sbin/tini
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static.asc /tmp/tini-static.asc
RUN gpg --standard-resolver --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7
RUN gpg --verify /tmp/tini-static.asc /sbin/tini
RUN chmod 755 /sbin/tini

# Have to do this _after_ installing yaourt
COPY yaourtrc /etc/

ENTRYPOINT ["tini", "-g", "--"]
CMD ["zsh"]


