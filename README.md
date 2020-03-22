NGINX server Docker image
=========================

[![Build Status](https://travis-ci.org/monstrenyatko/docker-nginx.svg?branch=master)](https://travis-ci.org/monstrenyatko/docker-nginx)


About
=====

[NGINX](https://www.nginx.com) web/reverse-proxy server in the `Docker` container.

Upstream Links
--------------
* Docker Registry @[monstrenyatko/nginx](https://hub.docker.com/r/monstrenyatko/nginx/)
* GitHub @[monstrenyatko/docker-nginx](https://github.com/monstrenyatko/docker-nginx)


Quick Start
===========

Container is already configured for automatic restart (See `docker-compose.yml`).

* Configure environment:

  - `NGINX_UID`: [**OPTIONAL**] `UID` to be used to run process instead of `default`:

    ```sh
      export NGINX_UID="1000"
    ```
  - `NGINX_GID`: [**OPTIONAL**] `GID` to be used to run process instead of `default`:

    ```sh
      export NGINX_GID="1000"
    ```
  - `DOCKER_REGISTRY`: [**OPTIONAL**] registry prefix to pull image from a custom `Docker` registry:

    ```sh
      export DOCKER_REGISTRY="my_registry_hostname:5000/"
    ```
* Pull prebuilt `Docker` image:

  ```sh
    docker-compose pull
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

Build own image
===============

* `default` target platform:

  ```sh
    cd <path to sources>
    DOCKER_BUILDKIT=1 docker build --tag <tag name> .
  ```
* `arm/v6` target platform:

  ```sh
    cd <path to sources>
    DOCKER_BUILDKIT=1 docker build --platform=linux/arm/v6 --tag <tag name> .
  ```
