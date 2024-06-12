#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

box="torcs-server"

./stop_vbox.sh

echo "Destroy VirtualBox $box"
vagrant destroy $box || "$box not found"
vagrant status
