#!/usr/bin/zsh

# 历史记录相关设置
typeset -x HISTFILE=${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-histfile
# 0b111111111111111111
typeset -x HISTSIZE=262143
# 0b11111111111111111
typeset -x SAVEHIST=131071
