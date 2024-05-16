#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

runtime="docker"
container="torcs-server"

./stop_ubuntu_mate.sh || echo "Container $container already stopped"
$runtime container rm -f $container || echo "Container $container does not exist"
