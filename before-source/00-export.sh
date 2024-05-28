#!/usr/bin/zsh

# 设定命令历史记录文件
typeset -x HISTFILE=${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-histfile
# 回头用 cmd-wrapped 能看见更多命令的统计
typeset -x HISTSIZE=65535
typeset -x SAVEHIST=65535

# 设置 Android SDK
if [[ -d "${HOME}/Android/Sdk" ]] {
    typeset -x ANDROID_HOME="${HOME}/Android/Sdk"
}

# 设置默认编辑器
if { { which -p nvim || which -p vim || which -p nano } | read TMP_VAR } {
    typeset -x EDITOR="$TMP_VAR"
    typeset -x VISUAL="$TMP_VAR"
    unset TMP_VAR
}
