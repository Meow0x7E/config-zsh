#!/usr/bin/zsh

if { 1>/dev/null which tmux } {
  alias terminal='tmux new-session -A -c "$HOME" -s "terminal" -t "terminal"'
}
