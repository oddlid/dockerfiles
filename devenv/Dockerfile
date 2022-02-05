FROM docker.io/golang:latest
LABEL maintainer="Odd Eivind Ebbesen <oddebb@gmail.com>"

ARG ARG_TZ="Europe/Stockholm"
ARG DOCKER_USER="devenv"
ARG BAT_VERSION="0.19.0"
ARG GITDELTA_VERSION="0.11.3"
ARG GITMUX_VERSION="0.7.6"
ARG RIPGREP_VERSION="13.0.0"
ARG K9S_VERSION="0.25.18"

ENV TZ=${ARG_TZ}
ENV DOCKER_USER=${DOCKER_USER}
ENV BAT_VERSION=${BAT_VERSION}
ENV GITDELTA_VERSION=${GITDELTA_VERSION}
ENV GITMUX_VERSION=${GITMUX_VERSION}
ENV RIPGREP_VERSION=${RIPGREP_VERSION}
ENV K9S_VERSION=${K9S_VERSION}

RUN set -eux; \
	curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg \
	https://packages.cloud.google.com/apt/doc/apt-key.gpg; \
	echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" \
	| tee /etc/apt/sources.list.d/kubernetes.list; \
	sh -c "curl -sL https://deb.nodesource.com/setup_16.x"; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		autoconf \
		automake \
		bc \
		cmake \
		curl \
		doxygen \
		dtach \
		fzf \
		g++ \
		gettext libtool \
		gosu \
		kubectl \
		less \
		libtool-bin \
		ninja-build \
		nodejs \
		npm \
		openssh-client \
		pkg-config \
		silversearcher-ag \
		tmux \
		tmux-plugin-manager \
		unzip \
		vim \
		weechat \
		yarn \
		zsh \
	; \
	rm -rf /var/lib/apt/lists/*

RUN set -eux; \
	cd /tmp \
	&& git clone https://github.com/neovim/neovim \
	&& cd neovim \
	&& make \
	&& make install \
	&& cd - \
	&& rm -rf neovim

RUN set eux; \
	arch="$(dpkg --print-architecture)"; arch="${arch##*-}"; \
	cd /tmp \
	&& curl -LO https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_${arch}.deb \
	&& dpkg -i bat_${BAT_VERSION}_${arch}.deb \
	&& rm -f bat_${BAT_VERSION}_${arch}.deb \
	&& curl -LO https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}_${arch}.deb \
	&& dpkg -i ripgrep_${RIPGREP_VERSION}_${arch}.deb \
	&& rm -f ripgrep_${RIPGREP_VERSION}_${arch}.deb \
	&& curl -LO https://github.com/dandavison/delta/releases/download/${GITDELTA_VERSION}/git-delta_${GITDELTA_VERSION}_${arch}.deb \
	&& dpkg -i git-delta_${GITDELTA_VERSION}_${arch}.deb \
	&& rm -f git-delta_${GITDELTA_VERSION}_${arch}.deb \
	&& curl -LO https://github.com/arl/gitmux/releases/download/v${GITMUX_VERSION}/gitmux_${GITMUX_VERSION}_linux_${arch}.tar.gz \
	&& tar -xf gitmux_${GITMUX_VERSION}_linux_${arch}.tar.gz \
	&& mv gitmux /usr/local/bin \
	&& rm -f gitmux_${GITMUX_VERSION}_linux_${arch}.tar.gz \
	&& curl -L https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash \
	&& local_arch=${arch}; if [ "$local_arch" = "amd64" ]; then local_arch="x86_64"; fi \
	&& curl -LO https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_linux_${local_arch}.tar.gz \
	&& tar -xf k9s_linux_${local_arch}.tar.gz \
	&& mv k9s /usr/local/bin/ \
	&& rm -f k9s_linux_${local_arch}.tar.gz LICENSE README.md

RUN useradd -m -s /usr/bin/zsh ${DOCKER_USER}
USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}

# Install all go tools vim-go and coc-go needs
RUN go install golang.org/x/tools/...@latest \
	&& go install github.com/klauspost/asmfmt/cmd/asmfmt@latest \
	&& go install github.com/go-delve/delve/cmd/dlv@latest \
	&& go install github.com/kisielk/errcheck@latest \
	&& go install github.com/davidrjenni/reftools/cmd/fillstruct@master \
	&& go install github.com/rogpeppe/godef@latest \
	&& go install golang.org/x/tools/cmd/goimports@master \
	&& go install golang.org/x/lint/golint@master \
	&& go install github.com/mgechev/revive@latest \
	&& go install golang.org/x/tools/gopls@latest \
	&& go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest \
	&& go install honnef.co/go/tools/cmd/staticcheck@latest \
	&& go install github.com/fatih/gomodifytags@latest \
	&& go install golang.org/x/tools/cmd/gorename@master \
	&& go install github.com/jstemmer/gotags@master \
	&& go install golang.org/x/tools/cmd/guru@master \
	&& go install github.com/josharian/impl@master \
	&& go install honnef.co/go/tools/cmd/keyify@master \
	&& go install github.com/fatih/motion@latest \
	&& go install github.com/koron/iferr@master

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install tmux plugins
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./tmux.conf .tmux.conf
RUN export TMUX_PLUGIN_MANAGER_PATH=${HOME}/.tmux/plugins \
	&& mkdir -p $TMUX_PLUGIN_MANAGER_PATH \
	&& /usr/share/tmux-plugin-manager/scripts/install_plugins.sh

# Install CoC plugins
RUN mkdir -p ~/.config/coc/extensions \
	&& cd ~/.config/coc/extensions \
	&& [[ -f package.json ]] || echo '{"dependencies":{}}'> package.json \
	&& npm install coc-sh --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-css --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-go --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-html --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-tsserver --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-markdownlint --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-perl --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	&& npm install coc-pyright --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# Install vim-plug for nvim
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
	&& mkdir -p ~/.local/share/nvim/site/pack/coc/start \
	&& cd ~/.local/share/nvim/site/pack/coc/start \
	&& curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install vim-plug for vim
RUN sh -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
	&& mkdir -p ~/.vim/pack/coc/start \
	&& cd ~/.vim/pack/coc/start \
	&& curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./init.vim .config/nvim/
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./init.vim .vimrc
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./dircolors .dircolors
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./zshrc .zshrc
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./devenv.zsh .oh-my-zsh/custom/
COPY --chown=${DOCKER_USER}:${DOCKER_USER} ./devenv-gallifrey.zsh-theme .oh-my-zsh/themes/

# Install nvim plugins
RUN nvim +'PlugInstall' +qa --headless

# Install vim plugins
# Ok, so this doesn't work... What to do...?
# RUN vim -E -s +PlugInstall +visual +qall


USER root
ENV SHELL=/usr/bin/zsh
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]


