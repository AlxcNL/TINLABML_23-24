#!/usr/bin/env bash

./stop_ubuntu_mate.sh || true

docker-compose up -d

sleep 6 && python -m webbrowser http://localhost:3000