#! /usr/bin/env bash

hostname="localhost"

if [[ -z "$1" ]]; then
    echo "Error. $0 requires a portnumber"
    exit 1;
fi

portnr="$1"

[[ -n "$2" ]] && hostname="$2"

echo "Torcs client is waiting for a connection with $hostname torcs-server at $portnr"
python ./run.py --port $portnr --hostname $hostname 