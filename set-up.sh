#!/bin/bash

sudo docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
sudo mkdir /opt/loki
sudo mkdir /opt/loki/loki_data
sudo mkdir /opt/loki/grafana_data
sudo chown -R 10001:10001 /opt/loki/loki_data #Directory perm for loki
sudo chown -R 472:472 /opt/loki/grafana_data/ #Directory perm for grafana
sudo docker-compose up -d