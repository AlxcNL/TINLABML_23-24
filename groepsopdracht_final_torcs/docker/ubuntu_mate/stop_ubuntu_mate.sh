#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

runtime="docker"
container="torcs-server"

$runtime container ps | grep $container && docker container stop $container
