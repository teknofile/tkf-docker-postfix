#!/bin/bash

docker create \
  --name=tkf-postfix \
  -e PUID=11 \
  -e PGID=952 \
  -e TZ=US/Mountain \
  -e TKF_MAILDOMAIN=copperdale.teknofile.net \
  -e TKF_RELAY_HOST="$(cat ./tkf.relayhost)" \
  -e TKF_MYNETWORKS="$(cat ./tkf.mynetworks)" \
  -e TKF_RELAY_PASSWORD="$(cat ./relay_password)" \
  -e TKF_MYHOSTNAME="$(cat ./tkf.myhostname)" \
  -v /mnt/usb/docker/tkf-postfix/:/config \
  -p 25:25 \
  --restart unless-stopped \
  --net=tkfdocker \
  teknofile/tkf-docker-postfix:devel
