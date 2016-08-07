#!/usr/bin/env bash

set -e

if [[ -n $KDB && -f "$KDB" ]]; then
	/usr/bin/kpcli --kdb="$KDB" $@
else
	exec $@
fi

