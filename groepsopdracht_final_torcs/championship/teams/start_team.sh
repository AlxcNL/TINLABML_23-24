#!/usr/bin/env bash

team="1"

[[ -n $1 ]] && team=$1
[[ ${#team} == 1 ]] && team="0${team}"

./stop_team.sh $team

cmd="docker-compose -f ${team}/docker-compose.yaml up" 
echo $cmd
eval $cmd
