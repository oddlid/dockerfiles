#!/usr/bin/env bash
APP=gmvault
DB_H=$HOME/${APP}_oddebb_gmail
DB_C=/home/${APP}/${APP}-db
/usr/bin/docker run --rm -it \
	-e DB_DIR=$DB_C \
	-e UID=$(id -u) \
	-v ${DB_H}:${DB_C} \
	-v $HOME/.${APP}:/home/${APP}/.${APP} \
	oddlid/${APP} $*

# Ex: oddlid-docker-gmvault.sh sync -t quick -c yes oddebb@gmail.com
