#!/bin/sh
#/usr/local/bin/dumb-init 

set -e

#chown -R bitlbee:bitlbee /var/lib/bitlbee
exec $@
