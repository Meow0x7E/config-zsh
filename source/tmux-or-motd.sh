#!/usr/bin/zsh

function _tmux() {
  if { ! command -v tmux 1>/dev/null } {
    return 0
  }

  if [[ "$(tty)" =~ ^/dev/tty[0-9]+$ ]] {
    return 0
  }

  if [[ -n "$TMUX" ]] {
    return 0
  }

  if [[ -n "$TERMUX_VERSION" ]] {
    return 0
  }

  if [[ -n "$SSH_CONNECTION" ]] {
    exec tmux new-session -A -c "$HOME" -s "terminal" -t "terminal"
  } else {
    tmux new-session -A -c "$HOME" -s "terminal" -t "terminal"
  }
}

function _motd() {
  typeset -a fastfetch_options=(--pipe 0)
  typeset cols="$(tput cols)" # 获取当前终端列数

  # 若终端宽度 ≤ 90 列，则将 logo 置于顶部，以节省横向空间
  if [[ -n "$cols" ]] && (( cols <= 90 )) {
    fastfetch_options+=(--logo-position top)
  }

  #( fastfetch $fastfetch_options | slow-scan-print -d 16ms -l -i ) &
  (fastfetch $fastfetch_options)
  unset fastfetch_options cols
}

_tmux
_motd

unfunction _tmux _motd
