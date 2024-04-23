#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

runtime="$runtime"

$runtime run -d \
  --name=webtop \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 3000:3000 \
  -p 3001:3001 \
  -v $PWD/config:/config \
  lscr.io/linuxserver/webtop:latest
