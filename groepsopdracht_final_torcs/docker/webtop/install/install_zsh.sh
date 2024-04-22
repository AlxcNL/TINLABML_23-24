#!/usr/bin/env sh

install_cmd="apt"
command -v nala && install_cmd="nala"

sudo ${install_cmd} update \
&& sudo ${install_cmd} install -y zsh
