#!/usr/bin/env bash

echo "APT Update"
apt update

echo "Install build-essential"
apt install -y build-essential

echo "Install cmake"
apt install -y cmake
