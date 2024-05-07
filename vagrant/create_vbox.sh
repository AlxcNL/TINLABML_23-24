#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

if [[ -f Vagrantfile ]]; then
    echo "Remove current Vagrant configuration"
    rm Vagrantfile
fi

echo "Create VirtualBox torcs-server"
vagrant init AlxcNL/torcs-server