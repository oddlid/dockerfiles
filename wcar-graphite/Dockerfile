# 2015-03-31 15:45:41
# Trying to create a Docker image from the Graphite install scripts Tobbe gave me.

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


# The instructions below should be adjusted for Docker usage
#RUN cd /opt/graphite/conf \
#		&& \
#		cp carbon.conf.example carbon.conf \
#		&& \
#		cp storage-schemas.conf.example storage-schemas.conf \
#		&& \
#		cd - \
#		&& \
#		/opt/graphite/bin/carbon-cache.py start
#
#RUN cd /opt/graphite/webapp/graphite \
#		&& \
#		cp local_settings.py.example local_settings.py \
#		&& \
#		python manage.py syncdb --noinput \
#		&& \
#		cd - \
#		&& \
#		cd /opt/graphite/conf \
#		&& \
#		cp graphite.wsgi.example graphite.wsgi \
#		&& \
#		cd - \
#		&& \
#		cp /opt/graphite/examples/example-graphite-vhost.conf /etc/httpd/conf.d/graphite.conf
