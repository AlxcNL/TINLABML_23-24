#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"

./stop_ubuntu_mate.sh || true

 podman run -d \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e TITLE="TINLAB Torcs Server" \
  -p 3000:3000 \
  -p 3001:3001 \
  -v $PWD/config:/config \
  -v $PWD/install:/tmp \
  --restart unless-stopped \
  lscr.io/linuxserver/webtop:ubuntu-mate

sleep 4;
python -m webbrowser http://localhost:3000/