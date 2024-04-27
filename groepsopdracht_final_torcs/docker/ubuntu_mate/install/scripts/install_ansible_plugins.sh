#!/usr/bin/env bash

echo "Install Ansible Community General"
ansible-galaxy collection install community.general

echo "Install Ansible Docker Galaxy Extension"
ansible-galaxy collection install community.docker

echo "Install Ansible Kubernetes Core Plugin"
ansible-galaxy collection install kubernetes.core