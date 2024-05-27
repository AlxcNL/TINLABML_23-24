#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

box="AlxcNL/torcs-server"

echo "Destroy VirtualBox $box"
vagrant destroy $box || "$box not found"
vagrant status
