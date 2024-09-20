#!/usr/bin/zsh

typeset -x HISTFILE=${HOME}/.cache/zsh-histfile
# 回头用 cmd-wrapped 能看见更多命令的统计
typeset -x HISTSIZE=65535
typeset -x SAVEHIST=65535

if [[ '${HOME}/.cargo/bin/' ]] {
    typeset -x PATH="${PATH}:${HOME}/.cargo/bin/"
}

if [[ -d '${HOME}/Android/Sdk/' ]] {
    typeset -x ANDROID_HOME="${HOME}/Android/Sdk/"
}

if [[ -x '/usr/bin/nvim' ]] {
    typeset -x EDITOR='/usr/bin/nvim'
    typeset -x VISUAL='/usr/bin/nvim'
}
