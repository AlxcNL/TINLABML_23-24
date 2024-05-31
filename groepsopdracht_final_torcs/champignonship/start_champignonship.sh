#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

repo="jaboo"
image_name="torcs-agent"
tag="0.1"
image="${repo}/${image_name}:${tag}"
entrypoint="bash"
container="torcs-server"

cmd="docker run --add-host host.docker.internal:host-gateway"
cmd="${cmd} --rm -it --name $container $image"
echo $cmd
eval $cmd