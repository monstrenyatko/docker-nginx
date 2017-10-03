#!/bin/sh

# Debug output
set -x

# Exit on error
set -e

if [ -n "$NGINX_GID" ]; then
	groupmod --gid $NGINX_GID nginx
	usermod --gid $NGINX_GID nginx
fi

if [ -n "$NGINX_UID" ]; then
	usermod --uid $NGINX_UID nginx
fi

if [ "$1" = 'nginx-app' ]; then
	shift;
	mkdir -p /var/tmp/nginx /var/cache/nginx /run/nginx
	chown -R nginx /var/tmp/nginx /var/cache/nginx /run/nginx
	exec nginx "$@"
fi

exec "$@"
