FROM ubuntu:22.04
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

ENV LANG C.UTF-8
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
  apt-get -qq update && \
  apt-get -y --no-install-recommends install \
  build-essential \
  ca-certificates \
  curl \
  upx-ucl \
  && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

