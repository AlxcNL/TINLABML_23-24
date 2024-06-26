#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

composefile="championship.yaml"
cmd="docker-compose -f ${composefile} up"
echo $cmd
eval $cmd
