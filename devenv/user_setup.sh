#!/usr/bin/env bash

# Setup everything user specific

setup_oh_my_zsh() {
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	#cp -a .oh-my-zsh/templates/.zshrc ~/.zshrc
 	# TODO: set up theme
}

setup_go_tools() {
	go install golang.org/x/tools/...@latest
}

setup_nvim_plugins() {
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	# nvim +'PlugInstall' +qa --headless
	# nvim +'PlugInstall' +qa --headless
	# nvim +':CocInstall coc-sh' +qa --headless
	# nvim +':CocInstall coc-css' +qa --headless
	# nvim +':CocInstall coc-go' +qa --headless
	# nvim +':CocInstall coc-html' +qa --headless
	# nvim +':CocInstall coc-tsserver' +qa --headless
	# nvim +':CocInstall coc-json' +qa --headless
	# nvim +':CocInstall coc-markdownlint' +qa --headless
	# nvim +':CocInstall coc-perl' +qa --headless
	# nvim +':CocInstall coc-pyright' +qa --headless
}

setup_vim_plugins() {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	#vim +'PlugInstall' +qa --headless
}

# setup_tmux_plugins() {
# 	# Look in /usr/share/tmux-plugin-manager/ for setup script
# }

# add_custom_zsh_settings() {
# }

setup_oh_my_zsh || (echo "Failed to setup Oh-My-ZSH" && exit 1)
# setup_go_tools || (echo "Failed to install go tools" && exit 1)
setup_nvim_plugins || (echo "Failed to install NeoVim plugins" && exit 1)
setup_vim_plugins || (echo "Failed to install vim plugins" && exit 1)
