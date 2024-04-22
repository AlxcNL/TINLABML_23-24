#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

apt --fix-broken install -y 2> /dev/null \
&& apt autoremove -y 2> /dev/null \
&& apt autoclean -y 2> /dev/null \
&& apt update 2> /dev/null \
&& apt upgrade -y 2> /dev/null 
