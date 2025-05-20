FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    gettext-base \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Скачиваем и устанавливаем Alloy
RUN curl -LO https://github.com/grafana/alloy/releases/download/v1.8.3/alloy-linux-amd64.zip && \
    unzip alloy-linux-amd64.zip && \
    mv alloy-linux-amd64 /usr/bin/alloy && \
    chmod +x /usr/bin/alloy && \
    rm -f alloy-linux-amd64.zip

COPY config.alloy.tmpl /etc/config.alloy.tmpl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
