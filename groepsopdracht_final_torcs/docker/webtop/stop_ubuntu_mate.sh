#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"

if [[ -n $(docker ps | grep torcs) ]]; then
    docker container stop $container
fi  