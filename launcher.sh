#!/bin/bash

set -eou pipefail

path="${1:-${HOME}}"
split_or_new="${2:-split}"
directories="$(fd . ${path} --type directory | fzf-tmux --multi --reverse)"
[ -z "${directories}" ] && exit
for dir in $directories; do
	tmux ${split_or_new}-window -c "${dir}"
done
