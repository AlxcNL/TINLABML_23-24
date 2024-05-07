#!/usr/bin/env bash
# Author: J.A.Boogaard@hr.nl

# eval "$(register-python-argcomplete pipx)"

sudo nala update \
&& sudo nala install -y ansible
# && pipx install --include-deps ansible
