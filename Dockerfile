FROM monstrenyatko/alpine

LABEL maintainer="Oleg Kovalenko <monstrenyatko@gmail.com>"

RUN apk update && \
    apk add nginx nginx-mod-stream && \
    # clean-up
    rm -rf /root/.cache && mkdir -p /root/.cache && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* \
    # delete default config
    rm -rf /etc/nginx/nginx.conf && \
    # forward request and error logs to docker log collector
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

ENV APP_NAME="nginx-app" \
    APP_USERNAME="nginx" \
    APP_GROUPNAME="nginx"

COPY run.sh /app/
COPY nginx.conf /etc/nginx/nginx.conf
RUN chown -R root:root /app
RUN chmod -R 0744 /app
RUN chmod 0755 /app/run.sh

VOLUME ["/var/cache/nginx"]

STOPSIGNAL SIGTERM

EXPOSE 80

ENTRYPOINT ["/app/run.sh"]
CMD ["nginx-app", "-g", "daemon off;"]
