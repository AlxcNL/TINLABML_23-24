#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

composefile="champignonship.yaml"
cmd="docker-compose -f ${composefile} up"
echo $cmd
eval $cmd
