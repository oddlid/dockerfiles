#!/usr/bin/env bash

set -e

chown -R bitlbee:bitlbee /var/lib/bitlbee

case "$1" in
	bb)
		/usr/sbin/bitlbee
		while true; do sleep 1h; done
		;;
	*)
		exec $*
		;;
esac

