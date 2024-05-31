#!/usr/bin/env bash

echo "APT Update"
sudo nala update

echo "Install build-essential"
sudo nala install -y build-essential

echo "Install cmake"
sudo nala install -y cmake
