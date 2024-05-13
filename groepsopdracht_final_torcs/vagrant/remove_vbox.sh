#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

box="torcs-server"
echo "Remove VirtualBox image $box"
vagrant box rm $box
