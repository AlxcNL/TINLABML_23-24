#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"
runtime="docker"

./stop_ubuntu_mate.sh || true

 $runtime container start -it \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Amsterdam \
  -e TITLE="TINLAB Torcs Server" \
  -p 3000:3000 \
  -p 3001:3001 \
  -v $PWD/config:/config \
  -v $PWD/install:/home/kasm-user \
  lscr.io/linuxserver/webtop:ubuntu-mate

sleep 4;
python3 -m webbrowser http://localhost:3000/
