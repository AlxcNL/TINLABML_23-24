#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# https://gist.github.com/abhisheknaik96/1e71dbb1e812174f300db32d20996a34

package="scr-client-cpp"
archive="${package}.tgz"
targetDir="/tmp/torcs"

wget "https://sourceforge.net/projects/cig/files/SCR%20Championship/Client%20C%2B%2B/2.0/${archive}" && \
mkdir -p "/tmp/torcs/${package}" && \
tar -v -xzf $archive --directory $targetDir && \
rm $archive

(
    cd "/tmp/torcs/${package}";
    make -j4;
)

echo "Make client global"
echo -e "\nexport PATH=\"${PATH}:/tmp/torcs/scr-client-cpp/\"" >> ~/.bashrc
