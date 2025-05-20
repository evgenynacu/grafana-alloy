FROM debian:bookworm-slim

# Устанавливаем нужные утилиты
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Скачиваем и устанавливаем Alloy (x86_64)
RUN curl -LO https://github.com/grafana/alloy/releases/download/v1.8.3/alloy-linux-amd64.zip && \
    unzip alloy-linux-amd64.zip && \
    mv alloy-linux-amd64 /usr/bin/alloy && \
    chmod +x /usr/bin/alloy && \
    rm -f alloy-linux-amd64.zip

# Копируем финальный конфиг (с поддержкой env("..."))
COPY config.alloy.hcl /etc/config.alloy.hcl

# Запускаем Alloy с конфигом
ENTRYPOINT ["/usr/bin/alloy", "run", "/etc/config.alloy.hcl"]
