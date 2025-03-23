#!/usr/bin/zsh

# 设定命令历史记录文件
typeset -x HISTFILE=${HOME}/.local/share/zsh-histfile
# 回头用 cmd-wrapped 能看见更多命令的统计
typeset -x HISTSIZE=65535
typeset -x SAVEHIST=65535

# 将通过 Cargo 安装的软件
if [[ -d "${HOME}/.cargo/bin" ]] {
    typeset -x PATH="${PATH}:${HOME}/.cargo/bin"
}

if [[ -d "${HOME}/Android/Sdk" ]] {
    typeset -x ANDROID_HOME="${HOME}/Android/Sdk"
}

if { { which -p nvim || which nano } | read TMP_VAR } {
    typeset -x EDITOR="$TMP_VAR"
    typeset -x VISUAL="$TMP_VAR"
}
