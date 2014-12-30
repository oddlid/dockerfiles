#!/usr/bin/env bash

set -e

case "$1" in 
	-h|-v|sync|restore|check|export)
		G_USER=gmvault
		if [ -n $UID ]; then
			GM_UID=$(id -u $G_USER)
			if [ $GM_UID -ne $UID ]; then
				usermod -u $UID $G_USER
				chown -R $G_USER /home/$G_USER
			fi
		fi
		if [ -z "$DB_DIR" ]; then
			DB_DIR=/home/$G_USER/gmvault-db
		fi
		if [ ! -d "$DB_DIR" ]; then
			mkdir -p "$DB_DIR"
			chown $G_USER "$DB_DIR"
		fi
		su - $G_USER -c "gmvault $* --db-dir $DB_DIR"
		;;
	*)
		exec $*
		;;
esac

#db_dir="${DB_DIR}"
#if [ ! $db_dir ] || [ ! -d $db_dir ] ; then
#  echo ""
#  echo "***************************************"
#  echo "must set DB_DIR environment variable, and dir must exist on container"
#  echo "***************************************"
#  echo ""
#
#  echo "EXAMPLE:"
#  echo "docker run -e DB_DIR=/mnt/storage/email-backup -i -t oddlid/gmvault sync your@gmail.com"
#  echo ""
#  exit 1
#fi
#gmvault $* --db-dir $db_dir
