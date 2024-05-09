#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-server"
runtime="docker"

./stop_ubuntu_mate.sh || true

 $runtime container run -i \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Amsterdam \
  -e TITLE="TINLAB Torcs Server" \
  -p 3000:3000 \
  -p 3001:3001 \
  -v "$PWD/config:/config" \
  torcs-server:0.1

sleep 4;
python3 -m webbrowser http://localhost:3000/
