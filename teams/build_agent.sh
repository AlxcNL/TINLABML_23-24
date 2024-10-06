#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

dockerfile="torcs-agent/Dockerfile" 
git_username=$(grep "name =" ../../.git/config | cut -d '=' -f2 | xargs)
ghcr_name="ghcr.io"
repo="${ghcr_name}/$(printf ${git_username} | tr '[:upper:]' '[:lower:]')"
image_name="torcs-agent"
arch=$(uname -m)

if [[ -n $1 ]]; then
    action=$1
else
    action="load"
fi

function buildImage() {
    printf "Build and %s image %s for %s\n" $action $image $arch;
    cmd="docker buildx build --${action} --build-arg PLATFORM=${arch} -f ${dockerfile} -t $image ."
    echo $cmd
    eval $cmd
}

tag="0.1"
image="${repo}/${image_name}:${tag}"
buildImage

if [[ "$action" -eq "push" ]]; then
    tag="latest"
    image="${repo}/${image_name}:${tag}"
    buildImage
fi
