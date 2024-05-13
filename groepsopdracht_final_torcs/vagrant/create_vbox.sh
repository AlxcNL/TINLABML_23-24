#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

box="torcs-server"
echo "Start VirtualBox $box"
echo "Create VirtualBox $box"
vagrant init AlxcNL/torcs-server --box-version 0.3 && \
./start_vbox.sh