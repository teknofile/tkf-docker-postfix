#!/bin/bash

docker create \
  --name=tkf-postfix \
  -e PUID=11 \
  -e PGID=952 \
  -e TZ=US/Mountain \
  -v /mnt/usb/docker/tkf-postfix/:/config \
  -p 25:25 \
  --restart unless-stopped \
  --net=tkfdocker \
  teknofile/tkf-docker-postfix:devel
