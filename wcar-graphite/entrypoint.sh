#!/usr/bin/env bash

DATA=/opt/graphite/storage

_init_dirs() {
# This needs to be run in order to make the shit start in the container
	mkdir $DATA #2>/dev/null
	mkdir $DATA/whisper #2>/dev/null
	mkdir $DATA/rrd #2>/dev/null
	mkdir -p $DATA/log/webapp #2>/dev/null
	touch $DATA/log/webapp/{access.log,error.log,exception.log,info.log}
	chown -R apache:apache $DATA
}

_init_db() {
	cd /opt/graphite/webapp/graphite
	python manage.py syncdb --noinput
	chown apache:apache $DATA/graphite.db # if sqlite as backend
	cd -
}

_start_graphite() {
	/opt/graphite/bin/carbon-cache.py start
	sleep 3
	service httpd start
}

_stop_graphite() {
	service httpd stop
	sleep 3
	/opt/graphite/bin/carbon-cache.py stop
}
