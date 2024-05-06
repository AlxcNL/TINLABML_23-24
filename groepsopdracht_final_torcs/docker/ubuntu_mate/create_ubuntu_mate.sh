#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

container="ubuntu-torcs"
runtime="docker"
base_image="lscr.io/linuxserver/webtop:ubuntu-mate"
target_image="tinlab/torcs-server"

./destroy_ubuntu_mate.sh || true

( 
  cd install;
  
  cat upgrade.sh \
  scripts/install_python.sh \
  scripts/install_ansible.sh \
  | $runtime container run \
    --name=$container \
    -i \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Europe/Amsterdam \
    -e TITLE="TINLAB Torcs Server" \
    --entrypoint "/bin/bash" \
    $base_image;

  cat playbooks/playbook-torcs.yaml \
  playbooks/playbook-torcs-server.yaml \
  | $runtime container start -i $container;

)

printf "Export container %s to iamge %s\n" $container $target_image
docker commit $container $target_image

# ./stop_ubuntu_mate.sh
