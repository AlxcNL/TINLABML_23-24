# Default base image
FROM bitnami/pytorch:2.3.0

LABEL MAINTAINER="Jeroen Boogaard <j.a.boogaard@hr.nl>"

WORKDIR /app

# Add torc-agent directory
ADD torcs-agent .

# Install python dependencies
RUN pip install \
    --upgrade pip \
    --no-cache-dir -r requirements.txt

USER 1001

ENTRYPOINT ["python", "run.py", "--hostname", "host.docker.internal", "--port", "3001"]