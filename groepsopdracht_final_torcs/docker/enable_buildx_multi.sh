#!/usr/bin/env bash

buildx create --use --name mybuild 
buildx create --append --name mybuild node-amd64
buildx --append --name mybuild node-arm64
