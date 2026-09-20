#!/usr/bin/zsh

# 设置默认编辑器
if { { command -v nvim || command -v vim || command -v nano } | read } {
  typeset -x EDITOR="$REPLY"
  typeset -x VISUAL="$REPLY"
  unset REPLY
}
