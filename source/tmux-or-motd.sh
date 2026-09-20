#!/usr/bin/zsh

zmodload -a zsh/regex

# 不是交互式 Shell 直接返回
[[ ! -o interactive ]] && return 0

function _in_tmux() {
  local pid=$$ data name

  while ((pid > 1)); do
    [[ -r "/proc/$pid/status" ]] || return 1
    data="$(</proc/${pid}/status)"

    if [[ "$data" =~ $'\nName:[[:space:]]+(tmux(: (client|server))?)\n' ]]; then
      return 0
    fi

    [[ "$data" =~ $'\nPPid:[[:space:]]+([0-9]+)' ]] || return 1
    pid="${match[1]}"
  done

  return 1
}

if command -v tmux 1>/dev/null && [[ -z "$TERMUX_VERSION" ]] && ! _in_tmux; then
  if [[ -n "$SSH_CONNECTION" ]]; then
    exec tmux new-session -A -c "$HOME" -s "terminal"
  else
    tmux new-session -A -c "$HOME" -s "terminal"
  fi
fi

if command -v fastfetch 1>/dev/null && _in_tmux; then
  if ((${COLUMNS:-80} <= 80)); then
    fastfetch --logo-position top
  else
    fastfetch
  fi
fi

unset -f _in_tmux
