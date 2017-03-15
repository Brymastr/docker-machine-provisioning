#!/bin/sh
yum update -y \
  && yum install -y net-tools \
  && curl -sSL https://get.docker.com/ | sh \
  && service docker start \
  && chkconfig docker on \
  && systemctl start firewalld \
  && systemctl enable firewalld \
  && firewall-cmd --add-port=2376/tcp --permanent \
  && firewall-cmd --add-port=2377/tcp --permanent \
  && firewall-cmd --add-port=7946/tcp --permanent \
  && firewall-cmd --add-port=7946/udp --permanent \
  && firewall-cmd --add-port=4789/udp --permanent \
  && firewall-cmd --reload \
  && systemctl restart docker