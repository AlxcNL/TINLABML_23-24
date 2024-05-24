#! /usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Error. $0 requires a portnumber"
    exit 1;
fi

portnr="$1"

echo "Torcs client is waiting for a connection with torcs-server at $portnr"
python ./run.py --port $portnr