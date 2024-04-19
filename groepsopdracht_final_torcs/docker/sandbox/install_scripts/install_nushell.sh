#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

package="nu-0.83.1-$(arch)-unknown-linux-gnu"
tar_file="${package}.tar.gz"
tar_url="https://github.com/nushell/nushell/releases/download/0.83.1"
dest="/usr/local/bin"

printf "Download %s\n" ${tar_file}
wget "${tar_url}/${tar_file}"

printf "Unzip %s\n" ${tar_file}
tar xzf ${tar_file}

dist=$(lsb_release -is)

if [[ $dist =~ "Debian" ]]; then
    printf "Install Debian requirements"
    sudo apt install -y pkg-config libssl-dev
fi    

echo "Install Cargo"
curl https://sh.rustup.rs -sSf | sudo sh -s -- -y
source "$HOME/.cargo/env"

echo "Install ${package} with Cargo"
(
    cd ${package}; 
    sudo install nu ${dest}
    sudo usermod -s $(which nu) ${USER}
)

printf "Cleanup"}
sudo rm ${tar_file}
sudo rm -rf ${package} 
