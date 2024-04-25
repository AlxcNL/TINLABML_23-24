#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

runtime="docker"
container="ubuntu-torcs"

if [[ -n $($runtime ps -a | grep torcs) ]]; then
    $runtime container stop $container
    $runtime container rm -f $container
fi  
