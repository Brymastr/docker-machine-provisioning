#!/bin/bash
source set-key-variable.sh

docker-machine create \
  -d vultr \
  --vultr-api-key=$VULTR_TOKEN \
  --swarm \
  --vultr-region-id 4 \
  --vultr-plan-id 201 \
  worker$i