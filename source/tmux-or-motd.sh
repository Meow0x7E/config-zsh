#!/usr/bin/zsh

# 如果有 tmux 则新建会话连接到 terminal 组
if { 1>/dev/null which tmux } && [[ ! "$(tty)" =~ /dev/tty* && -z "$TMUX" && -z "$TERMUX_VERSION" ]] {
  exec tmux new-session -A -c "$HOME" -s "terminal" -t "terminal"
} else {
  local -a fastfetch_options=(--pipe 0)
  local cols="$(tput cols)"
  if [[ -n "$cols" ]] && ((cols <= 90 )) {
    fastfetch_options+=(--logo-position top)
  }

  #( fastfetch $fastfetch_options | slow-scan-print -d 16ms -l -i ) &
  (fastfetch $fastfetch_options)
  unset fastfetch_options cols
}
