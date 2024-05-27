# Default base image
FROM bitnami/pytorch:2.3.0
ENV PORT=3001

LABEL MAINTAINER="Jeroen Boogaard <j.a.boogaard@hr.nl>"

# Add torc-agent directory
ADD torcs-agent /app/

USER root
RUN chmod u+x /app/start.sh

# USER 1001
# Install python dependencies
RUN python -m pip install --no-cache-dir -r requirements.txt

EXPOSE $PORT

ENTRYPOINT ["bash", "/app/start.sh", "3001"]
