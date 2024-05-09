#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# https://yaroslavgrebnov.com/blog/bash-docker-run-a-script-in-container-and-redirect-output-to-a-file-on-the-host-machine/

container="ubuntu-torcs"
runtime="docker"
base_image="lscr.io/linuxserver/webtop:ubuntu-mate"
target_image="jaboo/webtop-torcs:0.1"

./destroy_ubuntu_mate.sh || true

mkdir -p config

# cat upgrade.sh \
# scripts/install_python.sh \
# scripts/install_ansible.sh \
$runtime container run \
  --name=$container \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Amsterdam \
  -e TITLE="TINLAB Torcs Server" \
  -p 3000:3000 \
  -p 3001:3001 \
  -v "$PWD/config:/config" \
  $target_image

# printf "Export container %s to image %s\n" $container $target_image
# docker commit $container $target_image;

  # /home/kasm-user/playbooks/playbook-torcs.yaml;

# docker cp playbooks/easy_playbook.yaml $container:/tmp/easy_playbook.yaml;
# docker exec -i $container ansible-playbook /tmp/easy_playbook.yaml;

# ./stop_ubuntu_mate.sh
