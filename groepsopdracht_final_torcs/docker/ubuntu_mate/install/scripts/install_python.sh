#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# https://linuxpip.org/python-is-python3
# https://pipx.pypa.io/latest/installation/

if type -p "python" && [ -f /usr/bin/python3.10 ]; then
    echo "Python 3 already installed"
    exit 0;
fi

echo "Install software-properties-common"
apt install software-properties-common

echo "Update packages and install nala"
apt-get update \
&& apt-get install -y nala

echo "Install python, pip and pipx"
sudo nala install -y python-is-python3 \
    python3-full \
    python3-pip
#     pipx

# pipx ensurepath

# bash -l
# sudo pipx ensurepath --global
