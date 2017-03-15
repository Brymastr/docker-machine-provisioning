#!/bin/bash

wget https://github.com/janeczku/docker-machine-vultr/releases/download/v1.1.0/docker-machine-driver-vultr-v1.1.0-linux-amd64.tar.gz \
  && tar xf docker-machine-driver-vultr-v1.1.0-linux-amd64.tar.gz \
  && sudo mv docker-machine-driver-vultr /usr/local/bin \
  && sudo chmod +x /usr/local/bin/docker-machine-driver-vultr \