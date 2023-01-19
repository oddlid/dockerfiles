#!/usr/bin/env bash

# Example of to run this image, making use of local files

docker run --rm -it \
	-u $(id -u):$(id -g) \
	-e SHELL=/usr/bin/zsh \
	-v $HOME/.weechat:/home/devenv/.weechat \
	-v $HOME/.gitconfig:/home/devenv/.gitconfig \
	-v $HOME/.ssh:/home/devenv/.ssh \
	-v $HOME/my_project:/home/devenv/code \
	oddlid/devenv:latest
