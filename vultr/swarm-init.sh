#!/bin/bash

# 1 manager and 2 workers by default unless otherwise specified with parameter 1
workers=2
[ ! -z "$1" ] workers=$1

# Create an environment variable out of the vultr api key
source set-key-variable.sh

# # Download and install the vultr driver for docker-machine
wget https://github.com/janeczku/docker-machine-vultr/releases/download/v1.1.0/docker-machine-driver-vultr-v1.1.0-linux-amd64.tar.gz \
  && tar xf docker-machine-driver-vultr-v1.1.0-linux-amd64.tar.gz \
  && sudo mv docker-machine-driver-vultr /usr/local/bin \
  && sudo chmod +x /usr/local/bin/docker-machine-driver-vultr \

# Create the docker machine and swarm manager
docker-machine create \
  -d vultr \
  --vultr-api-key=$VULTR_TOKEN \
  --swarm-master \
  # --swarm-addr # defaults to machine ip \
  --vultr-region-id 4 \
  --vultr-plan-id 201 \
  manager1

for i in {1..workers} ; do
  docker-machine create \
    -d vultr \
    --vultr-api-key=$VULTR_TOKEN \
    --swarm \
    --vultr-region-id 4 \
    --vultr-plan-id 201 \
    worker$i ;
done