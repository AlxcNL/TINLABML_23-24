#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

box="torcs-server"
echo "Start VirtualBox $box"
echo "Destroy VirtualBox $box"
vagrant destroy $box
vagrant status