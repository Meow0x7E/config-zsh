#!/usr/bin/zsh

# 如果有 tmux 则新建会话连接到 terminal 组
if { 1>/dev/null which tmux } && [[ -z "$TMUX" ]] {
  2>/dev/null tmux has-session -t "terminal" || tmux new-session -d -X -c "$HOME" -s "terminal" -t "terminal"
  local session_name="terminal-$(date "+%s")"
  tmux new-session -s "$session_name" -t "terminal" \; set-option -t "$session_name" destroy-unattached on
}

find "${ZSH_CONFIG_HOME}/source" -type f -name "*.sh" | sort -n | while {read -r file} {
  source $file
}

local -a fastfetch_options=(--pipe 0)
local cols="$(tput cols)"
if [[ -n "$cols" ]] && ((cols <= 90 )) {
  fastfetch_options+=(--logo-position top)
}

( fastfetch $fastfetch_options | slow-scan-print -d 16ms -l -i )
unset fastfetch_options cols

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
