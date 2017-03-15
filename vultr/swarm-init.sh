#!/bin/bash

# 1 manager and 2 workers by default unless otherwise specified with parameter 1
workers=2
[ ! -z "$1" ] workers=$1

# Create an environment variable out of the vultr api key
source set-key-variable.sh

# Create the swarm manager
docker-machine create \
  -d vultr \
  --swarm-master
  --vultr-api-key=$VULTR_TOKEN \
  --vultr-region-id 4 \
  --vultr-plan-id 201 \
  --vultr-os-id 17 \
  --vultr-ssh-user "root" \
  --vultr-ssh-key-id "58bdd9862d752" \
  manager1

# Create the swarm workers
for i in {1..workers} ; do
  docker-machine create \
    -d vultr \
    --vultr-api-key=$VULTR_TOKEN \
    --vultr-region-id 4 \
    --vultr-plan-id 201 \
    --vultr-os-id 17 \
    --vultr-ssh-user "root" \
    --vultr-ssh-key-id "58bdd9862d752" \
    worker$i
done