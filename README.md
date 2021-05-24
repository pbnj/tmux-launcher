# tmux-launcher

A simple script to facilitate launching new or split tmux windows in specific
working directories, instead of:

```text
<prefix> + c
cd /path/to/working/directory
```

## Install

Clone this repository locally:

```sh
git clone https://github.com/pbnj/tmux-launcher </clone/path/to/tmux-launcher>
```

Then add the following to your `.tmux.conf`:

```text
if-shell " [ -d </clone/path/to/tmux-launcher> ] " run-shell "</clone/path/to/tmux-launcher>/tmux_launcher.tmux"
```

## Usage

To launch a split window:

```text
<prefix> + t
# fzf selections are opened in split (horizontal) windows
# like ' <prefix> + " ' then ' cd /path/to/working/directory '
```

To launch a new window:

```text
<prefix> + C-t
# fzf selections are opened in new windows
# like ' <prefix> + c ' then ' cd /path/to/working/directory '
```

## Configuration

You may configure options following the tmux syntax:

```text
set -g <key> <value>
```

The available options and their default values are:

- `@tmux-launcher-splitw-bind` = `t`
- `@tmux-launcher-neww-bind` = `C-t`
- `@tmux-launcher-dir` = `${HOME}`
