#!/bin/bash
source set-key-variable.sh

docker-machine create \
  -d vultr \
  --vultr-api-key=$VULTR_TOKEN \
  --vultr-region-id 4 \
  --vultr-plan-id 201 \
  --vultr-os-id 167 \
  --vultr-boot-script "47814" \
  --vultr-ssh-user "root" \
  --vultr-ssh-key-id "58bdd9862d752" \
  worker$i