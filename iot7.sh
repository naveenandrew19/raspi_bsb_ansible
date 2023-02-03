#!/bin/bash

#IOT7.0 BSP Application docker preparation
#docker build -t influxdb:2.4.0 influx_v2.4.0/
#docker build -t grafana:9.0.6 grafana_v9.0.6/
#docker build -t telegraf:1.24.2 telegraf_v1.24.2/
#docker build -t nodered:latest nodeRed_latest/
#docker build -t rabbitmq:3.11.6 RabbitMQ_v3.11.6/

#Diagnostic docker preparation
#docker build -t pushgateway:1.5.1 pushgateway/
#docker build -t prometheus:2.41.0 prometheus/
#docker build -t promtail:2.7.1 promtail/
#docker build -t loki:2.7.1 loki/

#Influxdb Mounting
docker volume create influxdb-etc
docker volume create influxdb-lib
docker volume create influxdb-log

#Grafana Mounting
docker volume create grafana-etc
docker volume create grafana-lib
docker volume create grafana-log

#telegraf Mounting
docker volume create telegraf-etc
docker volume create telegraf-log

#NodeRed Mounting
docker volume create nodered-lib
docker volume create nodered-log

#rabbitMQ Mounting
docker volume create rabbitmq-etc
docker volume create rabbitmq-log

#Prometheus Mounting
#docker volume create prometheus-lib

#Loki Mounting
#docker volume create loki-lib

#Promtail Mounting
#docker volume create promtail-lib

cd /home/ubuntu/raspi_packages/
docker compose up -d

sleep 20;
docker exec rabbitMQ /bin/bash rabbitmqctl add_user admin iplon321
docker exec rabbitMQ /bin/bash rabbitmqctl set_user_tags admin administrator
docker exec rabbitMQ /bin/bash rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
