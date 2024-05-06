#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

apt --fix-broken install -y nala \
&& nala update \
&& nala upgrade -y \
&& nala install -y software-properties-common \

# && apt autoremove -y \
# && apt autoclean -y \

