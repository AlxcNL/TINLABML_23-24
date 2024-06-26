#!/usr/bin/env bash

command="ls | grep -e \"[0-9][0-9]\" | xargs -I {} docker-compose -f {}/docker-compose.yaml build"
echo $command
eval $command
