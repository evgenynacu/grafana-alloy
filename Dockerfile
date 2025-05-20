FROM alpine:3.19

RUN apk add --no-cache bash curl gettext unzip

RUN curl -LO https://github.com/grafana/alloy/releases/download/v1.8.3/alloy-linux-amd64.zip && \
    unzip alloy-linux-amd64.zip && \
    mv alloy-linux-amd64 /usr/bin/alloy && \
    chmod +x /usr/bin/alloy && \
    rm -f alloy-linux-amd64.zip

COPY config.alloy.tmpl /etc/config.alloy.tmpl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
