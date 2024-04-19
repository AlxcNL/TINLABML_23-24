#!/usr/bin/env bash

python -m pip install --upgrade pip \
    bash_kernel \
    zsh_jupyter_kernel
    
python -m bash_kernel.install \
&& python -m zsh_jupyter_kernel.install --sys-prefix