# Standard nginx with dumb-init

FROM nginx:latest
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64 /usr/local/bin/dumb-init
RUN chmod 755 /usr/local/bin/dumb-init

CMD ["/usr/local/bin/dumb-init", "/usr/sbin/nginx", "-g" "daemon off;"]
