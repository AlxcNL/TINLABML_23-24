#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

#echo | sudo apt-add-repository ppa:ansible/ansible
sudo apt -y update \
&& sudo apt install -y ansible \
&& pipx install --include-deps ansible

sudo apt install -y cowsay
