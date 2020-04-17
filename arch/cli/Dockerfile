# Dockerfile for an Arch instance with stuff I need without X

FROM oddlid/arch-cli-minimal
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

RUN pacman -S --noconfirm --needed \
		ansible \
		antiword \
		arch-install-scripts \
		aspell \
		autoconf \
		automake \
		bc \
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
		ed \
		elinks \
		fakeroot \
		fastjar \
		gcc \
		go \
		html2text \
		htop \
		ipcalc \
		m4 \
		make \
		mc \
		mercurial \
		msmtp-mta \
		nmap \
		nodejs \
		nss \
		openbsd-netcat \
		p7zip \
		patch \
		pkg-config \
		rpmextract \
		sipcalc \
		strace \
		subversion \
		unace \
		unarj \
		unrar \
		unrtf \
		weechat \
		&& \
		rm -rf /var/cache/pacman/pkg/*
