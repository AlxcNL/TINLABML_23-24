#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

composefile="championship.yaml"
cmd="docker-compose -f ${composefile} up -d"
echo $cmd
eval $cmd
