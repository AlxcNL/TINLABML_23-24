#!/usr/bin/env bash

(
    cd ../src;    
    make clean;
    cd ../../;
    zip -r scr-client-cpp.zip scr-client-cpp;
    
)