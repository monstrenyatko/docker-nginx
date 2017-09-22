#!/bin/sh

# Debug output
set -v

# Exit on error
set -e

if [ "$1" = 'nginx-app' ]; then
	shift;
	echo Parameters: "\"$@\""
	mkdir -p /var/tmp/nginx /var/cache/nginx/
	chown -R nginx /var/tmp/nginx /var/cache/nginx
	exec nginx "$@"
fi

exec "$@"
