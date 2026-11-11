#!/usr/bin/zsh

if { command -v tmux 1>/dev/null; } {
	alias terminal='tmux new-session -A -c "$HOME" -s "terminal" -t "terminal"'
}
