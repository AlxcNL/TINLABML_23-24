#!/usr/bin/env bash

docker run -d \
  --name=webtop \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e TITLE=Webtop `#optional` \
  -p 3000:3000 \
  -p 3001:3001 \
  -v /$PWD:/config \
  --shm-size="1gb" `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/webtop:latest