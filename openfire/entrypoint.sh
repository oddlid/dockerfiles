#!/usr/bin/env bash

set -e

case "$1" in
	"openfire")
		EO=/etc/openfire
		VLO=/var/lib/openfire
		mkdir -p /data/{etc,var/lib} || echo "Data libs already exist"
		if [ ! -L $EO ]; then
			cp -a $EO /data/etc/
			mv $EO{,.orig}
			ln -s /data${EO} $EO
		fi
		if [ ! -L $VLO ]; then
			cp -a $VLO /data/var/lib/
			mv $VLO{,.orig}
			ln -s /data${VLO} $VLO
		fi
		chown -R openfire:openfire /data
		/usr/bin/java \
			-server \
			-DopenfireHome=/usr/share/openfire \
			-Dopenfire.lib.dir=/usr/share/openfire/lib \
			-classpath /usr/share/openfire/lib/startup.jar \
			-jar /usr/share/openfire/lib/startup.jar
		;;
	*)
		exec $*
		;;
esac
