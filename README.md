# DISCLAIMER

This is statsd server based on telegraf with consul discovery

## Usage:
```
docker run -d \
  -e CONSUL_HOST="172.0.0.1 172.0.1.2" \
  -e CONSUL_DC="mydc" \
  -e CONSUL_SERVICE_NAME="statsd" \
  -e INFLUX_HOST=influxdb.service.consul \
  -e INFLUX_DB=statsd \
  devopsftw/telegraf-statsd
```

## Env vars:
* CONSUL_HOST: list of consul servers to join separated by space
* CONSUL_DC: consul datacenter name
* CONSUL_SERVICE_NAME: service name to register in consul
* INFLUX_HOST: hostname of influxdb listening on default 8086 port
* INFLUX_DB: database name
