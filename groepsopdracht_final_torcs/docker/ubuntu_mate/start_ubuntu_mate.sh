#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-server"
runtime="docker"
host_port=3000

./stop_ubuntu_mate.sh || true

$runtime start $container

sleep 4;
python3 -m webbrowser http://localhost:${host_port}
