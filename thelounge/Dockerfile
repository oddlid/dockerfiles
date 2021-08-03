FROM thelounge/thelounge:alpine
LABEL maintainer="Odd E. Ebbesen <oddebb@gmail.com>"

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["thelounge", "start"]

# Themes are installed in $THELOUNGE_HOME, so I'll add them
# to the bind mounted dir instead of including them in the image.

# Run unprivileged.
# User "node" aready exists from parent image, with uid:gid 1000:1000
USER node
