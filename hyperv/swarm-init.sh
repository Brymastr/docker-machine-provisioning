#!/bin/bash

# 1 manager and 2 workers by default unless otherwise specified with parameter 1
workers=2

# Create the swarm manager
docker-machine create \
  -d hyperv \
  --hyperv-disk-size 10000 \
  --hyperv-virtual-switch "Primary Virtual Switch" \
  manager1

# Create the swarm workers
for (( i=1; i <= $workers; i++ )) ; do
  docker-machine create \
    -d hyperv \
    --hyperv-disk-size 10000 \
    --hyperv-virtual-switch "Primary Virtual Switch" \
    worker$i
done

# Get the IP address of the swarm manager
managerIP="$(docker-machine ip manager1)"

# Init the swarm
docker-machine ssh manager1 "docker swarm init \
  --advertise-addr $managerIP"

# Get the manager's worker_token for the worker machines to join the swarm
joinToken=$(docker-machine ssh manager1 "docker swarm join-token worker -q")

# Join the swarm
for (( i=1; i <= $workers; i++ )) ; do
  docker-machine ssh worker$i "docker swarm join \
    --token=$joinToken \
    $managerIP:2377"
done