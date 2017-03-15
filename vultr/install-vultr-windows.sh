#!/bin/bash
VERSION=1.2.2
FILENAME=docker-machine-driver-vultr-v$VERSION-Windows-x86_64.tar.gz

curl -L https://github.com/janeczku/docker-machine-vultr/releases/download/v1.2.2/$FILENAME > $FILENAME \
  && tar xf $FILENAME \
  && mv docker-machine-driver-vultr.exe ~/bin \
  && chmod +x ~/bin/docker-machine-driver-vultr.exe \
  && rm $FILENAME