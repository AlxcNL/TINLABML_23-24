#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

box="torcs-server"
echo "Start VirtualBox $box"
vagrant up --provider=virtualbox $box
vagrant status