FROM znc:1.9.0
MAINTAINER Odd E. Ebbesen <oddebb@gmail.com>

# Fix uid/gid for user znc to match my old image
RUN apk add --no-cache shadow tzdata && \
  usermod -u 1000 znc && \
  groupmod -g 1000 znc && \
  apk del shadow

