#!/usr/bin/zsh

if [[ "$(get-proc-name $PPID)" == "tmux: server" && "$(tmux display-message -p '#S')" =~ ssh-...... ]] {
  print "[33m你已被重定向至 Tmux 会话 ($(tmux display-message -p '#S'))"
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
