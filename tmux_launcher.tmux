#!/usr/bin/env bash
#===============================================================================
#   Author: Peter Benjamin
#  Created: May 21 2021
#===============================================================================
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# $1: option
# $2: default value
tmux_get() {
    local value
    value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

splitw="$(tmux_get '@tmux-launcher-splitw-bind' 't')"
neww="$(tmux_get '@tmux-launcher-neww-bind' 'C-t')"
dir="$(tmux_get '@tmux-launcher-dir' '${HOME}')"

tmux bind-key "$splitw" run -b "$SCRIPT_DIR/launcher.sh $dir split";
tmux bind-key "$neww" run -b "$SCRIPT_DIR/launcher.sh $dir new";
