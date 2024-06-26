#!/usr/bin/env bash

team="1"

[[ -n $1 ]] && team=$1
[[ ${#team} == 1 ]] && team="0${team}"

cmd="docker-compose -f ${team}/docker-compose.yaml down --remove-orphans" 
echo $cmd
eval $cmd
