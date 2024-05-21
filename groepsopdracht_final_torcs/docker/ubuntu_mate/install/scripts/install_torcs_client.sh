#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# https://gist.github.com/abhisheknaik96/1e71dbb1e812174f300db32d20996a34

package="scr-client-cpp"
archive="${package}.tgz"

wget "https://sourceforge.net/projects/cig/files/SCR%20Championship/Client%20C%2B%2B/2.0/${archive}"
tar -xzf $archive && rm $archive

(
    cd $package;
    make -j4;
)
