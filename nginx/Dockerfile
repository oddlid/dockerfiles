# Standard nginx with dumb-init

FROM nginx:latest
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

RUN curl -sL -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64 \
	&& \
	chmod 755 /usr/local/bin/dumb-init \
	&& \
	curl -sL -o /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
	&& \
	chmod 755 /usr/local/bin/gosu

CMD ["/usr/local/bin/dumb-init", "/usr/sbin/nginx", "-g" "daemon off;"]
