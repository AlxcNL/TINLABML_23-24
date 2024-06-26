#!/usr/bin/env bash

# default
cmd="status"
[[ -n "$1" ]] && cmd="$1"

function update() {
	echo "Update $1"
	git_command="ls | grep -e \"[0-9][0-9]\" | xargs -I {} git -C {} ${cmd}"
	
	echo $git_command
	eval $git_command

}

update
