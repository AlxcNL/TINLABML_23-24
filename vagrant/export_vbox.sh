#!/usr/bin/env bash

machine="torcs-server"

boxname="${machine}.box"
printf "Export VM %s\n" "${boxname}"

vagrant package ${machine} --output ${boxname}
md5sum ${boxname}
