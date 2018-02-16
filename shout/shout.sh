#!/usr/bin/env bash

set -e

if [ "$PRIVATE" = "true" ]; then
	/usr/bin/env shout --home $SHOUT_DIR --port "$PORT" --private "$@"
else
	/usr/bin/env shout --home $SHOUT_DIR --port "$PORT" --public "$@"
fi
