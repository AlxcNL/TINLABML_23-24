#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

runtime="docker"
container="torcs-server"

./stop_ubuntu_mate.sh || echo "Container $container already stopped"
# container_id="$($runtime container ps -a | grep $container | cut -d ' ' -f1)"
# echo $container_id
$runtime container rm -f $container

# docker ps -a
