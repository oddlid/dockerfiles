# Dockerfile for an Arch instance with stuff I need without X

FROM oddlid/arch-cli-minimal
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

RUN pacman -S --noconfirm --needed \
		ansible \
		antiword \
		aspell \
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
		html2text \
		mercurial \
		msmtp-mta \
		nodejs \
		p7zip \
		rpmextract \
		sipcalc \
		subversion \
		unace \
		unarj \
		unrar \
		unrtf \
		weechat \
		&& \
		rm -rf /var/cache/pacman/pkg/*

