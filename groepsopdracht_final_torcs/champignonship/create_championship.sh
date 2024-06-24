#!/usr/bin/env bash

header="services:"
compose_file="../champignonship.yaml"

(   
    cd teams;
    printf $header > $compose_file;
    cmd="ls | grep -e \"[0-9][0-9]\" | grep -vE 04";
    cmd="${cmd} | xargs -I {} cat {}/docker-compose.yaml";
    cmd="${cmd} | sed 's/$header/\\n/'  >> ${compose_file}";
    echo $cmd;
    eval $cmd;

)
