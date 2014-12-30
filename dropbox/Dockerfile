FROM debian:jessie
MAINTAINER Odd Eivind Ebbesen <odd@oddware.net>

COPY init /usr/local/bin/
COPY bootstrap.sh /root/
RUN cd /root && chmod 755 ./bootstrap.sh && ./bootstrap.sh

VOLUME ["/home/dropbox/config", "/home/dropbox/Dropbox"]

CMD ["/usr/local/bin/init"]
