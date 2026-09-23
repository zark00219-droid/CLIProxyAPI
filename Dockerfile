FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget https://github.com/router-for-me/CLIProxyAPI/releases/download/v7.3.15/CLIProxyAPI_7.3.15_linux_amd64.tar.gz \
    && tar -zxvf CLIProxyAPI_7.3.15_linux_amd64.tar.gz \
    && chmod +x cli-proxy-api


COPY config.yaml /app/config.yaml

EXPOSE 8317

CMD ["./cli-proxy-api", "--config", "config.yaml"]
