#!/bin/sh

set -e
set -u

: "${UID:=0}"
: "${GID:=${UID}}"

if [ "$#" = 0 ]; then
	set -- "$(command -v zsh 2>/dev/null || command -v bash 2>/dev/null || command -v sh)" -l
fi

if [ "$UID" != 0 ]
then
        usermod -u "$UID" "$DOCKER_USER_NAME" 2>/dev/null && {
                groupmod -g "$GID" "$DOCKER_USER_NAME" 2>/dev/null ||
                usermod -a -G "$GID" "$DOCKER_USER_NAME"
        }
        set -- gosu "${UID}:${GID}" "${@}"
fi

exec "$@"

