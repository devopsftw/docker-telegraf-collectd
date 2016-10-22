FROM telegraf:1.0-alpine
MAINTAINER Alex Salt <holy.cheater@gmail.com>

ENV INFLUX_HOST localhost
ENV INFLUX_DB statsd
ENV CONSUL_VERSION 0.7.0

RUN apk add --no-cache ca-certificates openssl && \
    wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip -d /usr/local/bin consul_${CONSUL_VERSION}_linux_amd64.zip && \
    wget https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux -O /usr/local/bin/ep && \
    chmod +x /usr/local/bin/ep && \
    apk del openssl

ADD entry-consul.sh /bin
ADD consul.tpl.json /consul.tpl.json
ADD telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT [ "entry-consul.sh" ]
