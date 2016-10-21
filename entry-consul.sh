#!/bin/sh

_term() {
    kill -INT $pid
    wait $pid
}
# trap term for gracefully stopping consul
trap _term TERM

# join listed consul hosts
if [ -z $CONSUL_HOST ]; then
    echo "CONSUL_HOST is empty"
    exit 1
fi

JOIN_STR=""
for node in $CONSUL_HOST; do
    JOIN_STR="${JOIN_STR} -join ${node}"
done

cp /consul.tpl.json /consul.json
/usr/local/bin/ep /consul.json
ret=$?
if [ $ret != 0 ]; then
    echo "envplate failed, some env vars not set"
    exit 1
fi
/usr/local/bin/consul agent -config-file /consul.json $JOIN_STR
pid=$!
wait $pid

source /entrypoint.sh
