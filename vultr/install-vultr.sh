#!/bin/bash
VERSION=1.2.2
FILENAME=docker-machine-driver-vultr-v$VERSION-linux-amd64.tar.gz

wget https://github.com/janeczku/docker-machine-vultr/releases/download/v$VERSION/$FILENAME \
  && tar xf $FILENAME \
  && sudo mv docker-machine-driver-vultr /usr/local/bin \
  && sudo chmod +x /usr/local/bin/docker-machine-driver-vultr \
  && rm $FILENAME