#!/usr/bin/zsh

[[ "${HOME}/.cargo/bin/" ]] && export PATH="${PATH}:${HOME}/.cargo/bin/"

[[ -d "${HOME}/Android/Sdk/" ]] && export ANDROID_HOME="${HOME}/Android/Sdk/"

export HISTFILE=${ZSH_CONFIG_HOME:-"${HOME}/.cache/histfile"}/.histfile
export HISTSIZE=20000
export SAVEHIST=20000

if [[ -x /usr/bin/nvim ]] {
    export EDITOR="/usr/bin/nvim"
    export VISUAL="/usr/bin/nvim"
}
