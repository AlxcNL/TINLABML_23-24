# Default base image
ARG BASE_IMAGE="continuumio/miniconda3:24.4.0-0"

FROM $BASE_IMAGE

LABEL MAINTAINER="Jeroen Boogaard <j.a.boogaard@hr.nl>"

ENV LANG=C.UTF-8

RUN ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

WORKDIR /app

# Add torc-agent directory
ADD torcs-agent .

RUN conda install -y conda-libmamba-solver && \
    conda config --set solver libmamba && \
    conda update -c defaults conda && \
    conda install -y -c pytorch cpuonly pytorch && \
    conda install -y -c conda-forge --file requirements.txt

USER 1001

ENTRYPOINT ["python", "run.py", "--port", "3003", "--hostname"]
CMD [ "localhost" ]
