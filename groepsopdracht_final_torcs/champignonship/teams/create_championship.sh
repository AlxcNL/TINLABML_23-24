#!/usr/bin/env bash

header="services:"
compose_file="championship.yaml"

echo $header > $compose_file

cmd="ls | grep -e \"[0-9][0-9]\""
cmd="${cmd} | xargs -I {} cat {}/docker-compose.yaml"
cmd="${cmd} | grep -v $header >> ${compose_file}"

echo $cmd
eval $cmd
