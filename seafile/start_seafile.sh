#!/usr/bin/env bash

/opt/seafile/seafile-server-latest/seafile.sh start >>/var/log/seafile.log 2>&1
socat TCP4-LISTEN:8080,fork TCP4:localhost:8081 &
sleep 3
if [ -n $FCGI ]; then
	SEAFILE_FASTCGI_HOST='0.0.0.0' /opt/seafile/seafile-server-latest/seahub.sh start-fastcgi >>/var/log/seahub.log 2>&1
else
	/opt/seafile/seafile-server-latest/seahub.sh start >>/var/log/seahub.log 2>&1
fi
tail -f /var/log/seafile.log /var/log/seahub.log
