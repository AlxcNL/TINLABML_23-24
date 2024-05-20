#!/usr/bin/env bash

function install_requirements() {
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
        subprocess32 

}

    # cpuonly \
function install_tf() {
    echo "Install TensorFlow with ROCM"
    sudo apt-get install -y rocm-libs rccl
    pip install --upgrade pip \
        protobuf==3.19.0 \
        tensorflow \
        tensorflow-rocm

    # echo "Test Tensorflow installation"

}

function install_pt() {
    # https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/3rd-party/pytorch-install.html
    echo "Install PyTorch with ROCM"
    pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.1/ && \
    pytorch
    
    echo "Test PyTorch installation"
    python -c 'import torch' 2> /dev/null && echo 'Success' || echo 'Failure'    

}

# install_requirements
# install_tf
install_pt
