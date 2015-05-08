FROM debian:jessie
MAINTAINER Odd Eivind Ebbesen <oddebb@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
# Change this to your preference
RUN ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime

RUN apt-get update -qq --fix-missing \
		&& \
		apt-get install -y --no-install-recommends \
		build-essential \
		python2.7 \
		python2.7-dev \
		python-pip \
		python-virtualenv \
		&& \
		pip install --allow-all-external -I gmvault==1.9 \
		&& \
		apt-get clean autoclean \
		&& \
		apt-get autoremove -y \
		&& \
		rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY gmvault.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/gmvault.sh
RUN useradd -m -u 1000 -U gmvault

VOLUME ["/home/gmvault/.gmvault", "/home/gmvault/gmvault-db"]

ENTRYPOINT ["/usr/local/bin/gmvault.sh"]
CMD ["bash"]

