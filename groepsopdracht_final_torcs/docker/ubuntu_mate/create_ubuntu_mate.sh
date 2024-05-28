#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

runtime="docker"

repo="jaboo"
version="0.2"
arch=$(uname -m)
image_name="torcs-server"
tag="${version}-${arch}"
image="${repo}/${image_name}:${tag}"

container="torcs-server"

host_port=3000
host_port_https=3021
container_port=3000
container_port_https=3021

./destroy_ubuntu_mate.sh || true

mkdir -p config
mkdir -p logs

cmd="$runtime container run -id --name=$container"
cmd="${cmd} -e PUID=1000 -e PGID=1000 -e TZ=Europe/Amsterdam -e TITLE=\"TINLAB Torcs Server\""
cmd="${cmd} -e CUSTOM_HTTPS_PORT=$container_port_https -p ${host_port}:${container_port}"
cmd="${cmd} -p ${host_port_https}:${container_port_https}"
cmd="${cmd} -v ${PWD}/config:/config ${image}"
cmd="${cmd} -v ${PWD}/desktop:/config/Desktop"
cmd="${cmd} -v ${PWD}/pics:/config/Pictures/"
cmd="${cmd} -v ${PWD}/config:/logs"
echo $cmd
eval $cmd

./stop_ubuntu_mate.sh
