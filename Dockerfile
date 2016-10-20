FROM telegraf:1.0-alpine
MAINTAINER Alex Salt <holy.cheater@gmail.com>

ENV INFLUX_HOST localhost
ENV INFLUX_DB statsd

ADD telegraf.conf /etc/telegraf/telegraf.conf
