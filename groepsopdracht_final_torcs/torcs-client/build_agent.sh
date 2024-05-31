#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

repo="jaboo"
image_name="torcs-agent"
tag="0.1"
image="${repo}/${image_name}:${tag}"
dockerfile="torcs-agent/Dockerfile" 
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

buildImage

if [[ "$action" -eq "push" ]]; then
    echo $image
    cmd="docker tag $image ${repo}/${image_name}:latest"
fi