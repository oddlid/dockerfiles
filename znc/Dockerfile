FROM znc:1.7.1
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

# Fix uid/gid for user znc to match my old image
RUN apk add --no-cache shadow && \
		usermod -u 1000 znc && \
		groupmod -g 1000 znc && \
		apk del shadow

# Modified original script to include "-g" in tini options
COPY 99-launch.sh /startup-sequence/
