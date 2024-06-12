#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-server"

cmd="docker-compose -f champignonship.yaml down"
echo $cmd
eval $cmd