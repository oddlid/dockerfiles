# carbonsphere/dock-privoxy with dumb-init
FROM carbonsphere/dock-privoxy
MAINTAINER Odd E. Ebbesen

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64 /usr/local/bin/dumb-init 
RUN chmod 755 /usr/local/bin/dumb-init

CMD ["/usr/local/bin/dumb-init", "/usr/local/bin/run.sh"]
