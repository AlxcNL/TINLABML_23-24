#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-server"
runtime="docker"
tag="0.1"
image="docker.io/jaboo/torcs-server"
host_port=3000
host_port_https=3021
container_port=3000
container_port_https=3021

./stop_ubuntu_mate.sh || true

$runtime container run -id \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Amsterdam \
  -e TITLE="TINLAB Torcs Server" \
  -e CUSTOM_HTTPS_PORT=$container_port_https \
  -p "${host_port}:${container_port}" \
  -p "${host_port_https}:${container_port_https}" \
  -v "${PWD}/config:/config" \
  -v "${PWD}/desktop:/config/Desktop" \
  -v "${PWD}/pics:/config/Pictures" \
  "${image}:${tag}" &

sleep 4;
python3 -m webbrowser http://localhost:${host_port}
