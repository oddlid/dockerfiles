FROM alpine:latest
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

RUN apk add --no-cache --update tzdata ca-certificates ngircd && rm -rf /var/cache/apk/*
COPY ngircd.conf /etc/ngircd/ngircd.conf

EXPOSE 6668
CMD ["ngircd", "-n"]
