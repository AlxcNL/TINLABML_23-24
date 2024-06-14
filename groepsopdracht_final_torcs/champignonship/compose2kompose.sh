#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    exit "Usage : $0 <composefile> [targetdir]"
fi

composefile="$1"

cmd="kompose --file $composefile convert"
echo $cmd
eval $cmd

if [[ ! -z "$2" ]]; then
    targetdir="$2"
    mkdir -p $targetdir
    cmd="mv torcs*agent*.yaml $targetdir/"
    echo $cmd
    eval $cmd
fi
