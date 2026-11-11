#!/usr/bin/zsh

# 历史记录相关设置
typeset -gx HISTFILE=${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-histfile
# 0b111111111111111111
typeset -gx HISTSIZE=262143
# 0b11111111111111111
typeset -gx SAVEHIST=131071
