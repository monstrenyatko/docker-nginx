#!/bin/sh

# Debug output
set -x

# Exit on error
set -e

if [ "$1" = 'nginx-app' ]; then
	shift;
	mkdir -p /var/tmp/nginx /var/cache/nginx /run/nginx
	chown -R nginx /var/tmp/nginx /var/cache/nginx /run/nginx
	exec nginx "$@"
fi

exec "$@"
