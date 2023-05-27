#!/usr/bin/env bash

# Credit to ThePrimeagen: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-cht.sh

languages=$(echo "javascript typescript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Your query: " query

if echo "$languages" | grep -qs $selected; then
	tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
	tmux split-window -h bash -c "curl cht.sh/$selected~$query | less"
fi
