FROM archlinux:base-devel
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

CMD ["zsh"]
ENV PAGER="/usr/bin/less"
ENV EDITOR="/usr/bin/vim"
ENV VISUAL="/usr/bin/vim"
ENV LANGUAGE="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ARG TZ="Europe/Stockholm"
ENV TZ="${TZ}"

# RUN sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
RUN pacman-key --init \
	&& pacman-key --populate archlinux

ARG COUNTRY="Sweden"
RUN pacman -Syyu --noconfirm --needed reflector \
	&& reflector --country "${COUNTRY}" --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist \
	&& pacman -Syyu --noconfirm --needed \
		ansible \
		ansible-core \
		git \
		openssh \
		python \
		vim \
		zsh \
	&& rm -rf /var/cache/pacman/pkg/*

# ARG SUDO_USER=oddee
# RUN useradd -m -G wheel,users -s /usr/bin/zsh ${SUDO_USER}

# USER ${SUDO_USER}
# RUN mkdir /tmp/yay \
# 	&& cd /tmp/yay \
# 	&& curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay" \
# 	&& makepkg -sicr --needed --noconfirm \
# 	&& cd - \
# 	&& rm -rf /tmp/yay \
# 	&& rm -rf ${HOME}/.cache
