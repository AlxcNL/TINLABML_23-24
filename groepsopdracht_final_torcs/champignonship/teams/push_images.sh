#!/usr/bin/env bash

docker images | grep torcs-agent | awk '{ print $1, $2 }' | sed 's/ /:/' | xargs -I {} docker push {}
