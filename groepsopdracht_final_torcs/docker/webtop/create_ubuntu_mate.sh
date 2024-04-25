#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"
runtime="docker"

./destroy_ubuntu_mate.sh || true

$runtime run \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e TITLE="TINLAB Torcs Server" \
  -p 3000:3000 \
  -p 3001:3001 \
  -v $PWD/config:/config \
  -v $PWD/install:/tmp \
  -ti --entrypoint=/tmp/upgrade.sh \
  lscr.io/linuxserver/webtop:ubuntu-mate 
  
