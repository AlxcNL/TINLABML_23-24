#!/usr/bin/env bash

echo "Config solver libmamba"
conda install -y conda-libmamba-solver \
&& conda config --set solver libmamba

echo "Update conda"
conda update -c defaults conda \

echo "Install packages with conda"
conda install -y -c conda-forge \
    bash \
    bash_kernel \
    conda-bash-completion \
    ipykernel \
    jupyterlab \
    jupyter_console \
    nbconvert \
    pandoc \
    pathlib \
    pypdf2 \
    shellcheck \
    subprocess32