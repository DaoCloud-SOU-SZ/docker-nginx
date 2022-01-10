FROM bitnami/git:2.34.1 AS agent

WORKDIR /agent

COPY run.sh .

COPY nginx.conf .

RUN chmod +x run.sh && \
    git clone https://github.com/apache/skywalking-nginx-lua.git && \
    rm -rf skywalking-nginx-lua/.git*

# FROM nginx:1.21.4
FROM openresty/openresty:1.19.9.1-buster

ENV NGINX_TYPE=openresty \
    NGINX_DIR=/etc/openresty \
    NGINX_FILE=nginx.conf

COPY --from=agent /agent/ /

ENTRYPOINT ["/run.sh"]

CMD ["/usr/bin/openresty", "-g", "daemon off;"]
