#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

./stop_vbox.sh

box="torcs-server"

echo "Start VirtualBox $box"
vagrant up --provider=virtualbox
vagrant status