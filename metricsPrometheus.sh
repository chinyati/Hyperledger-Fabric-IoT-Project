#!/bin/bash

sudo docker run -d --name prometheus-server -p 9090:9090 \
  --network IoT-network \
  --restart always \
  -v /home/kali/Hyperledger/fabric-samples/IoT-Project/prometheus/prometheus.yml:/prometheus.yml \
  prom/prometheus \
  --config.file=/prometheus.yml
