#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

box="AlxcNL/torcs-server"
echo "Remove VirtualBox image $box"
vagrant box remove $box

