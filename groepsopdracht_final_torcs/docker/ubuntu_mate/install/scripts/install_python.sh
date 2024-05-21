#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# https://linuxpip.org/python-is-python3
# https://pipx.pypa.io/latest/installation/
# https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/3rd-party/pytorch-install.html

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
    python3-pip \
    libjpeg-dev \
    python3-dev

pip install wheel setuptools
