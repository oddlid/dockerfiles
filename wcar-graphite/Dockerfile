FROM centos:centos6
MAINTAINER Odd E. Ebbesen

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y \
		bitmap-* \
		gcc \
		git \
		httpd \
		libffi-devel \
		mod_wsgi \
		openldap-devel \
		pycairo-devel \
		python-pip

ENV GR_C carbon
ENV GR_G graphite-web
ENV GR_TAG tags/0.9.13-pre1
ENV GR_BASEURL https://github.com/graphite-project

WORKDIR /tmp/

RUN git clone ${GR_BASEURL}/${GR_C}.git
RUN git clone ${GR_BASEURL}/${GR_G}.git

RUN cd ${GR_C} \
		&& \
		git checkout ${GR_TAG} \
		&& \
		pip install -r requirements.txt \
		&& \
		python setup.py install \
		&& \
		cd -

RUN cd ${GR_G} \
		&& \
		git checkout ${GR_TAG} \
		&& \
		pip install -r requirements.txt \
		&& \
		python setup.py install \
		&& \
		cd -

RUN chown -R apache:apache /opt/graphite/storage

EXPOSE 80 2003 2004
VOLUME ["/opt/graphite/storage/whisper", "/opt/graphite/storage/log", "/opt/graphite/storage/rrd"]

COPY entrypoint.sh /usr/local/bin/

