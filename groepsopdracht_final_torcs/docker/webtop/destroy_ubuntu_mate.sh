#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

runtime="$runtime"
container="ubuntu-torcs"

if [[ -n $($runtime ps | grep torcs) ]]; then
    $runtime container stop $container \
    && $runtime container rm -f $container >> /dev/null
fi  