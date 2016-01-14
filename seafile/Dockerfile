# See jenserat/seafile for more details

FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

RUN apt-get update -qq \
	&& \
	apt-get install -y --no-install-recommends \
	python2.7 \
	python-setuptools \
	python-simplejson \
	python-imaging \
	sqlite3 \
	python-mysqldb \
	python-memcache \
	socat \
	&& \
	ulimit -n 30000 \
	&& \
	apt-get clean autoclean \
	&& \
	apt-get autoremove -y \
	&& \
	rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64

COPY start_seafile.sh /usr/local/bin/
VOLUME ["/opt/seafile", "/var/log"]
EXPOSE 8000 8080 8082 10001 12001
CMD ["/usr/local/bin/dumb-init", "/usr/local/bin/start_seafile.sh"]
