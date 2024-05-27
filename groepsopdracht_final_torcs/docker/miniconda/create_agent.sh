#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="torcs-client"
runtime="docker"

# continuumio/miniconda3:24.3.0-0
tag="24.3.0-0"
repo="continuumio"
image_name="miniconda3"
image="${repo}/${image_name}:${tag}"

# docker pull continuumio/miniconda3

docker run -i -t continuumio/miniconda3 /bin/bash