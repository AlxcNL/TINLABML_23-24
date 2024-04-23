#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"

if [[ -n $(podman ps | grep torcs) ]]; then
    podman container stop $container \
    && podman container rm -f $container >> /dev/null
fi  