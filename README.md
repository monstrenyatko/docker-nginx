NGINX server Docker image for Raspberry Pi
==========================================

[![Build Status](https://travis-ci.org/monstrenyatko/docker-rpi-nginx.svg?branch=master)](https://travis-ci.org/monstrenyatko/docker-rpi-nginx)


About
=====

[NGINX](https://www.nginx.com) web/reverse-proxy server in a `Docker` container.

Upstream Links
--------------
* Docker Registry @[monstrenyatko/rpi-nginx](https://hub.docker.com/r/monstrenyatko/rpi-nginx/)
* GitHub @[monstrenyatko/docker-rpi-nginx](https://github.com/monstrenyatko/docker-rpi-nginx)


Quick Start
===========

* Pull prebuilt `Docker` image:

	```sh
		docker pull monstrenyatko/rpi-nginx
	```
* Start prebuilt image:

	```sh
		docker-compose up -d
	```
* Verify default configuration:

	Open `http://localhost:8000` in web browser.

* Stop/Restart:

	```sh
		docker-compose stop
		docker-compose start
	```
* Configuration:

	- Create the `conf.d` directory with `*.conf` file or files
	- Add to `docker-compose.yml` the `volumes` section:
	```yaml
		nginx:
		  ...
		  volumes:
		    - ./conf.d:/etc/nginx/conf.d:ro
	```
	- [**OPTIONAL**] Override the main configuration file:
	```yaml
		nginx:
		  ...
		  volumes:
		    - ./nginx.conf:/etc/nginx/nginx.conf:ro
	```

Container is already configured for automatic restart (See `docker-compose.yml`).

Build own image
===============

```sh
		cd <path to sources>
		./build.sh <tag name>
```
