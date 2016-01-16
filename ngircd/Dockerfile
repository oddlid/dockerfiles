FROM debian:jessie
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C

RUN apt-get -qq update \
		&& \
		apt-get install -y --no-install-recommends \
		ca-certificates \
		ngircd \
		&& \
		apt-get clean autoclean \
		&& \
		apt-get autoremove -y \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64 /usr/local/bin/dumb-init 
RUN chmod 755 /usr/local/bin/dumb-init

COPY ngircd.conf /etc/ngircd/ngircd.conf

#VOLUME ["/etc/ngircd"]
EXPOSE 6668
CMD ["/usr/local/bin/dumb-init", "/usr/sbin/ngircd", "-n"]
