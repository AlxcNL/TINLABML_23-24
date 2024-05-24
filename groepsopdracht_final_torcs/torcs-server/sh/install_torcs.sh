#!/usr/bin/env bash

torcs_dir="${HOME}/torcs"
mkdir -p $torcs_dir
torcs_server="torcs-1.3.7"
torcs_server_dir="${torcs_dir}/${torcs_server}"

[[ -d $torcs_server_dir ]] || gh repo clone fmirus/${torcs_server} $torcs_server_dir

(
    cd $torcs_server_dir;

    ./configure
    make
    sudo make install
    make datainstall

)