#!/usr/bin/env bash

echo "Config solver libmamba"
conda install -y conda-libmamba-solver \
&& conda config --set solver libmamba

echo "Update conda"
conda update -c defaults conda \

echo "Install packages with conda"
conda install -y -c conda-forge pytorch \
    bash_kernel \
    bpython \
    conda-bash-completion \
    ipykernel \
    gymnasium \
    joblib \
    jupyterlab \
    jupyter_console \
    jupyterlab_widgets \
    matplotlib \
    nbconvert \
    more-itertools \
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
    cpuonly \
    pytorch \
    torchvision

# conda install -y -c pytorch \
#     cpuonly \
#     pytorch \
#     torchvision

pip install --upgrade pip \
    tensorflow
