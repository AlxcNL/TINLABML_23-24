#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-server"

composefile="championship.yaml"
cmd="docker-compose -f ${composefile} down"
echo $cmd
eval $cmd