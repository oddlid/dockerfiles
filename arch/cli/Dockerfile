# Dockerfile for an Arch instance with stuff I need without X

FROM dock0/service
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV EDITOR /usr/bin/vim
ENV PAGER /usr/bin/less
ENV VISUAL /usr/bin/less
ENV LANG sv_SE.UTF-8
ENV REPORTTIME 5
ENV TIMEFMT %U user, %S system, %P cpu, %*Es total

COPY mirrorlist /etc/pacman.d/mirrorlist
COPY locale.conf locale.gen vconsole.conf /etc/ 

RUN echo -e "[archlinuxfr]\nSigLevel = Optional\nServer = http://repo.archlinux.fr/\$arch" >>/etc/pacman.conf
RUN groupadd sudo
RUN useradd -G sudo oddee
RUN locale-gen
RUN pacman -Syy
RUN pacman -S --noconfirm --needed \
		ansible \
		antiword \
		arch-install-scripts \
		aspell \
		autoconf \
		automake \
		bash-completion \
		bind-tools \
		binutils \
		bzr \
		cabextract \
		cdrkit \
		cpanminus \
		cpio \
		cvs \
		ddclient \
		dnsmasq \
		docker \
		dtach \
		ed \
		elinks \
		fakeroot \
		fastjar \
		file \
		flac \
		gcc \
		go \
		godep \
		html2text \
		htop \
		inetutils \
		ipcalc \
		lame \
		lbzip2 \
		lesspipe \
		lsof \
		lzop \
		m4 \
		make \
		mc \
		mercurial \
		msmtp-mta \
		nmap \
		nss \
		openbsd-netcat \
		openssh \
		p7zip \
		patch \
		pkg-config \
		rpmextract \
		rsync \
		screen \
		sipcalc \
		strace \
		subversion \
		sudo \
		tmux \
		unace \
		unarj \
		unrar \
		unrtf \
		unzip \
		weechat \
		whois \
		vim \
		vim-plugins \
		yaourt \
		zip \
		zsh \
		zsh-completions \
		&& \
		rm -rf /var/cache/pacman/pkg/*

# Have to do this _after_ installing yaourt
COPY yaourtrc /etc/

CMD ["bash"]


