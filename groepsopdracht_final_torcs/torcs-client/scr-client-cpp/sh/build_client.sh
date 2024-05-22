#!/usr/bin/env sh

(
	cd ..;

	echo "Remove current Client";
	make clean;
	sudo unlink /usr/local/bin/torcs-client

	echo "Rebuild Client";
	make;

	echo "Make client globally available as torcs-client";
	sudo ln -s $(realpath ./client) /usr/local/bin/torcs-client;

)	
