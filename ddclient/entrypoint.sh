#!/usr/bin/env bash
set -e

on_die() {
	echo "Stopping..."
	exit 0
}

trap 'on_die' TERM SIGINT

case "$1" in
	ddclient)
		NAPTIME=10m
		TMOUT=10s
		# Set $SLEEPTIME at docker run with '-e SLEEPTIME=1h' for example 
		if [ -n $SLEEPTIME ]; then
			NAPTIME=$SLEEPTIME
		fi
		# Adjust at runtime with -e as above
		if [ -n $TIMEOUT ]; then
			TMOUT=$TIMEOUT
		fi
		while timeout $TIMEOUT ddclient -daemon=0 -verbose | grep -i 'success'; do 
			echo $(date --rfc-3339=seconds) ": Sleeping for $NAPTIME ..."
			sleep $NAPTIME 
		done
		;;
	*)
		exec $*
		;;
esac
