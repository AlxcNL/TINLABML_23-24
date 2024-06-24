#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

composefile="champignonship_test.yaml"
cmd="docker-compose -f ${composefile} up"
echo $cmd
eval $cmd
