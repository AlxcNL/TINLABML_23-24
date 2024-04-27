#!/usr/bin/env sh
# Author: J.A.Boogaard@hr.nl

install_cmd="apt"
command -v nala && install_cmd="nala"

sudo ${install_cmd} update \
&& sudo ${install_cmd} install -y zsh
