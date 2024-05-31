#!/usr/bin/env bash

(
	cd ..;
    mkdir -p logs;

    echo "Clear previous log";
    date > logs/torcs_client.log;

    echo "Start client with logging";
    export TORCS_SERVER="localhost";
    torcs-client | tee -a logs/torcs_client.log;

)
