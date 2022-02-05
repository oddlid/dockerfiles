# Docker development environment

This is a Docker image for mainly Golang development in vim/neovim,
but with plugins and tools for a lot more. The intention is to get a
fully automated replica of the setup I currently use in a VM and in WSL.

## Included tools:

- bat
- build tools
- fzf
- git
- git-delta
- gitmux
- golang
- helm
- k9s
- kubectl
- nodejs
- npm
- nvim
- ripgrep (rg)
- silver searcher (ag)
- tmux
- vim
- weechat
- yarn
- zsh (oh-my-zsh)

## Example of how to run:

```sh
docker run --rm -it \
	-u $(id -u):$(id -g) \
	-e SHELL=/usr/bin/zsh \
	-v $HOME/.weechat:/home/devenv/.weechat \
	-v $HOME/.gitconfig:/home/devenv/.gitconfig \
	-v $HOME/.ssh:/home/devenv/.ssh \
	-v $HOME/my_project:/home/devenv/code \
	oddlid/devenv:latest
```
