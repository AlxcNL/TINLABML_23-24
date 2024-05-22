#!/usr/bin/env bash

export TORCS_SERVER="localhost"

function drive {
    mkdir -p logs

    echo "Clear previous log"
    date > logs/torcs_client.log

    echo "Start client with logging"
    torcs-client | tee -a logs/torcs_client.log    

}

 drive
