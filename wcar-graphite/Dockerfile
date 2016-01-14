FROM centos:centos6
MAINTAINER Odd E. Ebbesen

ENV GR_C carbon
ENV GR_G graphite-web
ENV GR_TAG tags/0.9.13-pre1
ENV GR_BASEURL https://github.com/graphite-project

WORKDIR /tmp/

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
		&& \
		yum install -y \
		bitmap-* \
		gcc \
		git \
		httpd \
		libffi-devel \
		mod_wsgi \
		openldap-devel \
		pycairo-devel \
		python-pip \
		&& \
		git clone ${GR_BASEURL}/${GR_C}.git \
		&& \
		git clone ${GR_BASEURL}/${GR_G}.git \
		&& \
		cd ${GR_C} \
		&& \
		git checkout ${GR_TAG} \
		&& \
		pip install -r requirements.txt \
		&& \
		python setup.py install \
		&& \
		cd - \
		&& \
		cd ${GR_G} \
		&& \
		git checkout ${GR_TAG} \
		&& \
		pip install -r requirements.txt \
		&& \
		python setup.py install \
		&& \
		cd - \
		&& \
		rm -rf ./${GR_C} ./${GR_G} \
		&& \
		yum clean all \
		&& \
		chown -R apache:apache /opt/graphite/storage

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64 \
		&& \
		chmod 755 /usr/local/bin/dumb-init \
		&& \
		curl -sL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
		&& \
		chmod 755 /usr/local/bin/gosu

WORKDIR /opt/graphite

EXPOSE 80 2003 2004
VOLUME ["/opt/graphite/storage/whisper", "/opt/graphite/storage/log", "/opt/graphite/storage/rrd"]

COPY entrypoint.sh /usr/local/bin/

