#!/bin/bash
# Odd E. Ebbesen <oddebb@gmail.com>, 2014-12-28 16:21:50

export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
apt-get update -qq --fix-missing
apt-get install -y --no-install-recommends \
	python2.7 \
	python-pip \
	python-virtualenv \
	build-essential \
	python2.7-dev
pip install --allow-all-external -I gmvault==1.8.1-beta

apt-get clean autoclean
apt-get autoremove -y
rm -rf /var/lib/{apt,dpkg,cache,log}/

