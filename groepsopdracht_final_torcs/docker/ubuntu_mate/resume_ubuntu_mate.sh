#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"
runtime="docker"

$runtime start  `$runtime ps -q -l` # restart it in the background
$runtime attach `$runtime ps -q -l` # reattach the terminal & stdi