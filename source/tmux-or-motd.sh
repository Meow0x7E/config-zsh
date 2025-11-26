#!/usr/bin/zsh

# 如果有 tmux 则新建会话连接到 terminal 组
if { 1>/dev/null which tmux } && [[ -z "$TMUX" ]] {
  2>/dev/null tmux has-session -t "terminal" || tmux new-session -d -c "$HOME" -s "terminal" -t "terminal"
  tmux new-session -A -X -c "$HOME" -s "terminal" -t "terminal"
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
