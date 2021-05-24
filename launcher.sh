#!/usr/bin/env bash

path="${1:-${HOME}}"
split_or_new="${2:-split}"

directories="$(fd . ${path} --type directory | fzf-tmux -d 20% --multi --reverse -0)"

[ -z "${directories}" ] && exit

for dir in $directories; do
	tmux ${split_or_new}-window -c "${dir}"
done
