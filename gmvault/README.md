# oddlid/gmvault

A docker image for running [gmvault](http://gmvault.org/)
Based on narf/gmvault, but slightly adjusted.

### Example:

Create a wrapper script to start gmvault in docker:

```
#!/usr/bin/env bash
APP=gmvault
DB_H=$HOME/${APP}-db
DB_C=/home/${APP}/${APP}-db
/usr/bin/docker run --rm -it \
	-e DB_DIR=$DB_C \
	-e UID=$(id -u) \
	-v ${DB_H}:${DB_C} \
	-v $HOME/.${APP}:/home/${APP}/.${APP} \
	oddlid/${APP} $*
```

Then pass arguments to gmvault to the script, like this:

```
./docker-gmvault.sh sync you@gmail.com
```

Or just get a shell or run a command by passing anything that is not recognized by gmvault as an option or a subcommand.

