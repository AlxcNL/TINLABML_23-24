#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"

if [[ -n $(docker ps | grep $container) ]]; then
    docker container stop $container
fi
