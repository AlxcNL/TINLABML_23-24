#!/usr/bin/env bash

git_username="AlxcNL"
ghcr_name="ghcr.io"
ghcr_secret=$(sudo cat /usr/local/ghcr_secret)

cmd="docker login --username ${git_username} --password ${ghcr_secret} ${ghcr_name}"
echo $cmd
eval $cmd
