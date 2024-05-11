#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-server"
runtime="docker"
tag="ubuntu-mate"
image="torcs-server:0.1"
host_port=3020
host_port_https=3031

./destroy_ubuntu_mate.sh

$runtime container run -d \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Amsterdam \
  -e TITLE="TINLAB Torcs Server" \
  -p $host_port:3000 \
  -p $host_port_https:3001 \
  -v "$PWD/config:/config" \
  "$image:$tag"

sleep 4;
python3 -m webbrowser http://localhost:${host_port}/
