#!/usr/bin/env bash

# Setup everything user specific

setup_oh_my_zsh() {
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

setup_go_tools() {
	declare -a -r go_tools=(
		golang.org/x/tools/...@latest
		github.com/klauspost/asmfmt/cmd/asmfmt@latest
		github.com/go-delve/delve/cmd/dlv@latest
		github.com/kisielk/errcheck@latest
		github.com/davidrjenni/reftools/cmd/fillstruct@master
		github.com/rogpeppe/godef@latest
		golang.org/x/tools/cmd/goimports@master
		golang.org/x/lint/golint@master
		github.com/mgechev/revive@latest
		golang.org/x/tools/gopls@latest
		github.com/golangci/golangci-lint/cmd/golangci-lint@latest
		honnef.co/go/tools/cmd/staticcheck@latest
		github.com/fatih/gomodifytags@latest
		golang.org/x/tools/cmd/gorename@master
		github.com/jstemmer/gotags@master
		golang.org/x/tools/cmd/guru@master
		github.com/josharian/impl@master
		honnef.co/go/tools/cmd/keyify@master
		github.com/fatih/motion@latest
		github.com/koron/iferr@master
	)
	for pkg in "${go_tools[@]}"; do
		go install $pkg
	done
}

install_coc_plugins() {
	declare -r -a coc_plugins=(
		coc-sh
		coc-css
		coc-go
		coc-html
		coc-tsserver
		coc-json
		coc-markdownlint
		coc-perl
		coc-pyright
	)
	mkdir -p ~/.config/coc/extensions
	declare -r npm_options="--global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod"
	cd ~/.config/coc/extensions
	if [ ! -f package.json ]; then
		echo '{"dependencies":{}}'> package.json
	fi
	for plugin in "${coc_plugins[@]}"; do
		npm install $plugin $npm_options
	done
}

setup_nvim_plugins() {
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	mkdir -p ~/.local/share/nvim/site/pack/coc/start
	cd ~/.local/share/nvim/site/pack/coc/start
	curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

	# This works fine, so I'm tempted to not care right now if the vim counterpart doesn't work...
	nvim +'PlugInstall' +qa --headless
}

setup_vim_plugins() {
	sh -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	mkdir -p ~/.vim/pack/coc/start
	cd ~/.vim/pack/coc/start
	curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

	# Ok, so this doesn't work... What to do...?
	vim -E -s +PlugInstall +visual +qall
}

setup_tmux_plugins() {
	# Look in /usr/share/tmux-plugin-manager/ for setup script
	export TMUX_PLUGIN_MANAGER_PATH=${HOME}/.tmux/plugins
	cd $HOME \
	&& mkdir -p $TMUX_PLUGIN_MANAGER_PATH \
	&& /usr/share/tmux-plugin-manager/scripts/install_plugins.sh \
	&& cd -
}

# setup_oh_my_zsh || (echo "Failed to setup Oh-My-ZSH" && exit 1)
# setup_go_tools || (echo "Failed to install go tools" && exit 1)
# setup_nvim_plugins || (echo "Failed to install NeoVim plugins" && exit 1)
# setup_vim_plugins || (echo "Failed to install vim plugins" && exit 1)
# install_coc_plugins || (echo "Failed to install CoC plugins" && exit 1)
# setup_tmux_plugins || (echo "Failed to install tmux plugins" && exit 1)
