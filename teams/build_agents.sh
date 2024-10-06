#/usr/bin/env bash

dockerfile="torcs-agent/Dockerfile" 
git_username="AlxcNL"
ghcr_name="ghcr.io"
repo="${ghcr_name}/$(printf ${git_username} | tr '[:upper:]' '[:lower:]')"
image_name="torcs-agent"
arch=$(uname -m)
tag="latest"
image="${repo}/${image_name}:${tag}"
action="load"

cmd="docker buildx build --${action} --build-arg PLATFORM=${arch}"

(
    cd teams;
    ls | xargs -I {} echo "(cd $PWD/{}; ${cmd} -f torcs-agent/Dockerfile -t $image .)";
    # ls | xargs -I {} echo "${cmd} -f {}/torcs-agent/Dockerfile -t $image .";
)