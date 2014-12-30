#!/usr/bin/env bash
# Runtime setup for quassel-core in Docker
# Odd E. Ebbesen <oddebb@gmail.com>, 2014-10-02 09:50:51


### starting over..
# - user/group/homedir has been created at docker build: quasselcore:quassel /var/lib/quassel
# What we need to check, is if the container is started with a bind mount to an existing config dir
# or not. The contents of the config dir when freshly installed will be the file "quasselCert.pem".
# If started with a bind mount, the file "quassel-storage.sqlite" should be in the dir.
# So, if quassel-storage.sqlite exists, then get the gid and uid from it and update the quassel 
# user/group to match before running quasselcore.

Q_HOME=/var/lib/quassel
Q_DB=$Q_HOME/quassel-storage.sqlite
Q_USER=quasselcore
Q_GROUP=quassel

if [[ -r $Q_DB ]]; then
   FINFO=$(ls -nd $Q_DB)
   Q_UID=$(echo $FINFO | awk '{print $3}')
   Q_GID=$(echo $FINFO | awk '{print $4}')
   groupmod --gid $Q_GID $Q_GROUP
   usermod --uid $Q_UID $Q_USER
fi

# start it like this
# docker run -d --net="host" --privileged=true --name quasselcore -v /var/lib/quassel:/var/lib/quassel oddlid/quassel-core core
# There might be a better way if ZNC is also in Docker, by using links, but I need to look deeper into that

if [[ "core" == $1 || "" == $1 ]]; then
   #su - $Q_USER -c "/usr/bin/quasselcore --listen=0.0.0.0 --configdir=$Q_HOME"
   # Need supervisor as quassel does not run in the foreground
   /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
else
   exec $*
fi
