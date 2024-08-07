#!/usr/bin/env bash

docker buildx create --use --name mybuild 
docker buildx create --append --name mybuild node-amd64
docker buildx --append --name mybuild node-arm64
