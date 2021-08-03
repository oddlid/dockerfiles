FROM znc:1.8.2
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

# Fix uid/gid for user znc to match my old image
RUN apk add --no-cache shadow && \
		usermod -u 1000 znc && \
		groupmod -g 1000 znc && \
		apk del shadow

# 2019-08-26 22:15: This seemed to cause problems in v1.7.4, so disabling it
# Modified original script to not run tini, as I do it in entrypoint instead
#COPY 99-launch.sh /startup-sequence/

ENTRYPOINT ["/entrypoint.sh"]
