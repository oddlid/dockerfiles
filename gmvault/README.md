# oddlid/gmvault

A docker image for running [gmvault](http://gmvault.org/)
Based on narf/gmvault, but slightly adjusted.

### Example:

```
DB_C=/mnt/gmvault DB_H=$HOME/gmvault docker run -it \
	 -e "DB_DIR=$DB_C" \
	 -v $DB_H:$DB_C \
	 oddlid/gmvault \
	 sync your.email@gmail.com
```

## Notes:

Should specify -v /some/dir:/root/.gmvault for having access to settings outside container
Modify gmvault.sh or bootstrap script to run with the same user ID as the calling user.

