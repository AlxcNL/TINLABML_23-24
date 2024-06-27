#!/usr/bin/env bash

header="services:"
compose_file="championship.yaml"
teams_dir="teams"

printf "%s\n" $header > $compose_file;


for team in "$@"
do
    [[ ${#team} == 1 ]] && team="0${team}"
    cat "${teams_dir}/${team}/docker-compose.yaml" | sed 's/services://' >> $compose_file    
    echo >> $compose_file

done