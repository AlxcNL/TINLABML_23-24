#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

(
    cd scripts;
    sudo ./upgrade.sh;
)

sudo apt install -y git wget

if ( ! command -v ansible ); then
    echo "Install Ansible"
    (
        cd scripts;
        sudo ./install_python.sh \
        && ./install_ansible.sh \
        && ./install_ansible_plugins.sh;
    )
fi

if ( ! command -v zsh ); then
    echo "Install zsh"
    (
        cd scripts;
        ./install_zsh.sh \
        && (./install_oh_my_zsh.sh) \
        && ./install_zsh_autosuggestions.sh \
        && ./install_zsh_syntax_highlight.sh;
    )

fi

(
    cd playbooks;
    ./playbook-torcs.yaml;
)