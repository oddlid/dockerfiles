FROM debian:jessie
MAINTAINER Odd Eivind Ebbesen <oddebb@gmail.com>

COPY gmvault.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/gmvault.sh
RUN useradd -m -u 1000 -U gmvault
COPY bootstrap.sh /root/
RUN cd /root && chmod 755 ./bootstrap.sh && ./bootstrap.sh

VOLUME ["/home/gmvault/.gmvault", "/home/gmvault/gmvault-db"]

ENTRYPOINT ["/usr/local/bin/gmvault.sh"]
CMD ["bash"]

