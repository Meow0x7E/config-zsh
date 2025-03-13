#!/usr/bin/zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit \
    lucid \
    depth'1' \
    for \
        light-mode \
            'romkatv/powerlevel10k'

zinit \
    wait'0' \
    lucid \
    depth'1' \
    for \
        light-mode \
            'zsh-users/zsh-syntax-highlighting' \
        light-mode \
            atinit'bindkey -v' \
            'jeffreytse/zsh-vi-mode' \
        light-mode \
            atload"
                zstyle ':completion:*:git-checkout:*' sort false
                zstyle ':completion:*:descriptions' format '[%d]'
                zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
                zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
                zstyle ':fzf-tab:*' switch-group ',' '.'
            " \
            'Aloxaf/fzf-tab' \
        light-mode \
            atinit"
                typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
                typeset -g ZSH_AUTOSUGGEST_MANUAL_REBIND=0
                typeset -g ZSH_AUTOSUGGEST_HISTORY_IGNORE=\'?(#c50,)\'
            " \
            'zsh-users/zsh-autosuggestions' \
        light-mode \
            atload'zicompinit; zicdreplay' \
            'zsh-users/zsh-completions' \
