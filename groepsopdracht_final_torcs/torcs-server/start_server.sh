#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

mkdir -p logs
date > logs/torcs_server.log; torcs >> logs/torcs_server.log
