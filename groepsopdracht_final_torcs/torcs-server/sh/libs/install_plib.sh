#!/usr/bin/env sh

version="1.8.5"
dir="plib-${version}"
archive="${dir}.tar.gz"

sudo nala install -y wget
wget "https://plib.sourceforge.net/dist/${archive}"

tar xzf $archive && \
rm $archive

(
	cd $dir;
	./configure;
	make install;
)

# rm -rf $dir
