#!/bin/bash

docker create \
  --name=tkf-postfix \
  -e PUID=11 \
  -e PGID=952 \
  -e TZ=US/Mountain \
  -e TKF_MAILDOMAIN=copperdale.teknofile.net \
  -e TKF_RELAY_HOST=email-smtp.us-west-2.amazonaws.com:587 \
  -e TKF_MYNETWORKS="127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 192.168.0.0/24 172.16.50.0/24 172.19.0.0/16" \
  -e TKF_RELAY_PASSWORD="$(cat ./relay_password)" \
  -v /mnt/usb/docker/tkf-postfix/:/config \
  -p 25:25 \
  --restart unless-stopped \
  --net=tkfdocker \
  teknofile/tkf-docker-postfix:devel
