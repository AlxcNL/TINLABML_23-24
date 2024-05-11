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
    itertools \
    joblib \
    jupyterlab \
    jupyter_console \
    matplotlib \
    nbconvert \
    numpy \
    pandoc \
    pandas \
    pathlib \
    pypdf2 \
    scipy \
    scikit-learn \
    seaborn \
    shellcheck \
    subprocess32 \
    tensorflow

pipx install bpython
