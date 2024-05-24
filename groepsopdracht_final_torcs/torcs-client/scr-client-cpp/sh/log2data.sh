#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

track="$1"
csvfile="csv/${track}_$(date +%F).csv"
logfile="logs/torcs_client.log"

if [ -z "$track" ]; then
    echo "Error. $0 requires a trackname"
    exit 1;
fi

(
    cd ..;
    cat $logfile | grep ';' > $csvfile;
)
