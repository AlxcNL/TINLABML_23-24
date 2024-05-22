#!/usr/bin/env sh

(
	cd ..;
	echo "Remove current Client"
	make clean;

	echo "Rebuild Client"
	make clean && \
	make;

)	
