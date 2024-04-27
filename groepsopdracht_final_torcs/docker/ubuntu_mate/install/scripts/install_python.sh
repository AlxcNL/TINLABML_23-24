#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa

if type -p "python" && [ -f /usr/bin/python3.10 ]; then
    echo "Python 3 already installed"
    exit 0;
fi

echo "Install software-properties-common"
apt install software-properties-common

#echo "Reinstall ca-certificates"
#apt-get install -y --reinstall ca-certificates

# TODO
# https://stackoverflow.com/questions/68992799/warning-apt-key-is-deprecated-manage-keyring-files-in-trusted-gpg-d-instead

#echo "Sign"
#apt-key adv --keyserver "hkp://keyserver.ubuntu.com:80" --recv "F23C5A6CF475977595C89F51BA6932366A755776"

echo "Add ppa"
add-apt-repository "deb https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy main "

echo "Update packages"
apt update \
    && apt upgrade \
    && apt autoremove

echo "Install python 3.10"
apt install -y python3.10

echo "Make python 3.10 default"
ln -s /usr/bin/python3.10 /usr/bin/python

echo "Install pip and pipx"
apt install -y python3-pip \
&& pip install pipx
