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
  -v $PWD/config:/config \
  -v $PWD/install:/home/kasm-user \
  --entrypoint /home/kasm-user/setup.sh \
  lscr.io/linuxserver/webtop:ubuntu-mate

./stop_ubuntu_mate.sh
