#!/usr/bin/env bash

git_username=$(grep "name =" ../../.git/config | cut -d '=' -f2 | xargs)
ghcr_name="ghcr.io"
ghcr_secret=$(sudo cat /usr/local/ghcr_secret)

docker login --username $git_username --password $ghcr_secret $ghcr_name
