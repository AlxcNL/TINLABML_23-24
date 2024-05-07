#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# https://yaroslavgrebnov.com/blog/bash-docker-run-a-script-in-container-and-redirect-output-to-a-file-on-the-host-machine/

container="ubuntu-torcs"
runtime="docker"
base_image="lscr.io/linuxserver/webtop:ubuntu-mate"
target_image="tinlab/torcs-server"

./destroy_ubuntu_mate.sh || true

( 
  cd install;
  
  # cat upgrade.sh \
  # scripts/install_python.sh \
  # scripts/install_ansible.sh \
  # | $runtime container run \
  #   --name=$container \
  #   -i \
  #   -e PUID=1000 \
  #   -e PGID=1000 \
  #   -e TZ=Europe/Amsterdam \
  #   -e TITLE="TINLAB Torcs Server" \
  #   --entrypoint "/bin/bash" \
  #   $base_image;

# printf "Export container %s to image %s\n" $container $target_image
  # docker commit $container $target_image;

  # cat playbooks/playbook-torcs.yaml \
  # playbooks/playbook-torcs-server.yaml \
  cat playbooks/easy_playbook.yaml \
  | $runtime container run \
    --name=$container \
    -id \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Europe/Amsterdam \
    -e TITLE="TINLAB Torcs Server" \
    $target_image;
    # /home/kasm-user/playbooks/playbook-torcs.yaml;

  docker cp playbooks/easy_playbook.yaml $container:/tmp/easy_playbook.yaml;
  docker exec -i $container ansible-playbook /tmp/easy_playbook.yaml;

)

# ./stop_ubuntu_mate.sh
