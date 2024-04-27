#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

sudo apt-get update \
sudo apt-get install -y software-properties-common \
&& sudo apt-get install -y git wget python3

if ( ! command -v ansible ); then
    echo "Install Ansible"
    (
        sudo /home/kasm-user/scripts/install_python.sh \
        /home/kasm-user/scripts/install_ansible.sh \
        && /home/kasm-user/scripts/install_ansible_plugins.sh
    )
fi

# /home/kasm-user/playbooks/playbook-torcs.yaml \
# && /home/kasm-user/playbooks/playbook-torcs-server.yaml
