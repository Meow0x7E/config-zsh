#!/usr/bin/zsh

# 设置默认编辑器
if { { which -p nvim || which -p vim || which -p nano } | read } {
  typeset -x EDITOR="$REPLY"
  typeset -x VISUAL="$REPLY"
  unset REPLY
}
