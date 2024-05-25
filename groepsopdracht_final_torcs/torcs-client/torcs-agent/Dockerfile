# Default base image
ARG BASE_CONTAINER=jaboo/simpylc-notebook
ARG NB_USER=$NB_USER

# Use custom base image
FROM $BASE_CONTAINER

LABEL MAINTAINER="Jeroen Boogaard <j.a.boogaard@hr.nl>"

# Install python dependencies
COPY requirements.txt .
RUN python -m pip install -U pip setuptools
RUN python -m pip install -U jupyterthemes
RUN python -m pip install --no-cache-dir -r requirements.txt

# print to stdout without buffering
ARG PYTHONUNBUFFERED=1 
# don't generate *.pyc files
ARG PYTHONDONTWRITEBYTECODE=1 

# Copy custom script
COPY run_script.sh /usr/local/bin/run_script

USER ${NB_USER}

RUN jt -t monokai

RUN mkdir -p /home/student/notebooks \
    && mkdir -p /home/student/projects \
    && mkdir -p /home/student/scripts

WORKDIR /home/student

EXPOSE 8888

ENV DISPLAY=host.docker.internal:0.0