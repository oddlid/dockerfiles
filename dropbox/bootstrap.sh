#!/bin/bash
# Odd E. Ebbesen <oddebb@gmail.com>, 2014-12-09 20:27:18

export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
apt-get update -qq
#apt-get install -y --only-upgrade bash
apt-get install -y --no-install-recommends wget openssl gnutls-bin ca-certificates
ln -sT /etc/ssl /usr/ssl
useradd -m dropbox
wget -nv -O /tmp/dropbox.tgz https://www.dropbox.com/download?plat=lnx.x86_64
tar -xzf /tmp/dropbox.tgz -C /usr/local
mv /usr/local/.dropbox-dist /usr/local/dropbox-dist
ln -s /usr/local/dropbox-dist/dropboxd /usr/local/bin/
apt-get purge -y wget man
apt-get clean autoclean
apt-get autoremove -y
rm -rf /var/lib/{apt,dpkg,cache,log}/
rm -f /tmp/dropbox.tgz
