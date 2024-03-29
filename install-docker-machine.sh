#!/bin/bash

# Download and install the docker-machine binary
curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine \
  && chmod +x /tmp/docker-machine \
  && sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
