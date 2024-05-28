#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-server"
runtime="docker"
tag="0.2"
image="docker.io/jaboo/torcs-server"
host_port=3000
host_port_https=3021
container_port=3000
container_port_https=3021

./destroy_ubuntu_mate.sh || true

mkdir -p config
mkdir -p logs

$runtime container run -id \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Amsterdam \
  -e TITLE="TINLAB Torcs Server" \
  -e CUSTOM_HTTPS_PORT=$container_port_https \
  -p "${host_port}:${container_port}" \
  -p "${host_port_https}:${container_port_https}" \
  -v "${PWD}/config:/logs" \
  -v "${PWD}/config:/config" \
  "${image}:${tag}"

echo "Create Desktop shortcut"
docker cp desktop/mate-terminal.desktop $container:/config/Desktop/;
docker cp desktop/torcs.desktop $container:/config/Desktop/;
docker cp pics/Torcs-title.png $container:/config/Pictures/;

./stop_ubuntu_mate.sh
