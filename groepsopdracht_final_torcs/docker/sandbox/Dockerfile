ARG BASE_IMAGE
FROM ${BASE_IMAGE}

LABEL authors="J.A.Boogaard@hr.nl"

# Upgrade and install packages
ADD install_scripts/*.sh /tmp/
RUN chmod +x /tmp/*.sh \
    && /tmp/upgrade.sh
    
# Create User and home directory
ARG CUSTOM_USER
ENV HOME="/home/${CUSTOM_USER}"
# RUN mkdir -p ${HOME} \

RUN useradd -u 1002 \
    -s /bin/bash \
    -c student \
    -m \
    -d ${HOME} \
    -G sudo,users,abc \
    ${CUSTOM_USER}   

RUN chown ${CUSTOM_USER} /app \
    && chown ${CUSTOM_USER} /defaults \
    && chown ${CUSTOM_USER} ${HOME}

# ports and volumes
EXPOSE 3000
EXPOSE 3001