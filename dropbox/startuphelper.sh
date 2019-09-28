#!/bin/sh

# 2019-09-28:
# On request from Luke Davoll, I'm making a hack to specify UID/GID at runtime.
# - Odd

set -euo pipefail

isnum() {
	case $1 in
		''|*[!0-9]*) return 1 ;;
		*) return 0 ;;
	esac
}

opt_u=0
opt_g=0
ug="dropbox"
ugspec="$ug:$ug"

while getopts 'u:g:' option; do
  case $option in
    u) isnum $OPTARG && opt_u=$OPTARG;;
    g) isnum $OPTARG && opt_g=$OPTARG;;
  esac
done
shift $(expr $OPTIND - 1)


if [ $opt_g -gt 0 ]; then
	groupmod -g $opt_g $ug
fi

if [ $opt_u -gt 0 ]; then
	usermod -u $opt_u $ug
fi

# Try to prevent automatic updates that kills the container
# See: https://wiki.archlinux.org/index.php/dropbox
su-exec $ugspec install -dm0 /home/dropbox/.dropbox-dist

if [ $# -gt 0 ]; then
	exec su-exec $ugspec $*
else
	exec su-exec $ugspec dropboxd
fi

