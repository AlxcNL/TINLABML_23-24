#!/usr/bin/env bash

(
	cd ..;	

    echo "Clear previous log";
    date > logs/torcs_client.log;

    echo "Start client with logging";
    torcs-client | tee -a logs/torcs_client.log;    

)
