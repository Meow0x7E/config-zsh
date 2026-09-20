#!/usr/bin/bash

if command -v tmux 1>/dev/null; then
  alias terminal='tmux new-session -A -c "$HOME" -s "terminal" -t "terminal"'
fi
