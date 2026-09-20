if command -v fastfetch 1>/dev/null && is-in-tmux; then
  if ((${COLUMNS:-80} <= 80)); then
    fastfetch --logo-position top
  else
    fastfetch
  fi
fi
