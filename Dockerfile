FROM hypriot/rpi-alpine:3.6

MAINTAINER Oleg Kovalenko <monstrenyatko@gmail.com>

RUN apk update && \
    apk add --no-cache nginx && \
    rm -rf /etc/nginx/nginx.conf && \
    \
    # forward request and error logs to docker log collector
    ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log && \
    \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apk/*

COPY run.sh /
RUN chmod +x /run.sh

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME ["/etc/nginx"]

STOPSIGNAL SIGTERM

EXPOSE 80

ENTRYPOINT ["/run.sh"]
CMD ["nginx-app", "-g", "daemon off;"]
