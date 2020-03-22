FROM alpine:3

MAINTAINER Oleg Kovalenko <monstrenyatko@gmail.com>

RUN apk update && apk upgrade && \
    apk add --no-cache nginx nginx-mod-stream shadow && \
    rm -rf /root/.cache && mkdir -p /root/.cache && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* && \
    \
    # delete default config
    rm -rf /etc/nginx/nginx.conf && \
    \
    # forward request and error logs to docker log collector
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY run.sh /
RUN chmod +x /run.sh

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME ["/var/cache/nginx"]

STOPSIGNAL SIGTERM

EXPOSE 80

ENTRYPOINT ["/run.sh"]
CMD ["nginx-app", "-g", "daemon off;"]
