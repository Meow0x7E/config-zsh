if command -v tmux 1>/dev/null && [[ -o interactive ]] && [[ -z "$TERMUX_VERSION" ]] && ! is-in-tmux; then
  if [[ -n "$SSH_CONNECTION" ]]; then
    exec tmux new-session -A -c "$HOME" -s "terminal"
  else
    tmux new-session -A -c "$HOME" -s "terminal"
  fi
fi
