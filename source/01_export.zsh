#!/usr/bin/zsh

export HISTFILE=${ZSH_CONFIG_HOME:-"${HOME}/.cache/histfile"}/.histfile
# 回头用 cmd-wrapped 能看见更多命令的统计
export HISTSIZE=20000
export SAVEHIST=20000

if [[ '${HOME}/.cargo/bin/' ]] {
    export PATH="${PATH}:${HOME}/.cargo/bin/"
}

if [[ -d '${HOME}/Android/Sdk/' ]] {
    export ANDROID_HOME="${HOME}/Android/Sdk/"
}

if [[ -x '/usr/bin/nvim' ]] {
    export EDITOR='/usr/bin/nvim'
    export VISUAL='/usr/bin/nvim'
}
