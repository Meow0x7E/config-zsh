#!/usr/bin/zsh

typeset -x HISTFILE=${HOME}/.cache/zsh-histfile
# 回头用 cmd-wrapped 能看见更多命令的统计
typeset -x HISTSIZE=65535
typeset -x SAVEHIST=65535

if [[ -d "${HOME}/.cargo/bin" ]] {
    typeset -x PATH="${PATH}:${HOME}/.cargo/bin"
}

if [[ -d "${HOME}/Android/Sdk" ]] {
    typeset -x ANDROID_HOME="${HOME}/Android/Sdk"
}

if { which nvim 1>&- } {
    typeset -a findList=(${(f)"$(which -a nvim)"})

    for p ($findList) {
        if [[ -x $p ]] {
            typeset -x EDITOR=$p
            typeset -x VISUAL=$p
        }
    }
}
