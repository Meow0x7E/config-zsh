#!/usr/bin/zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# 主题
zinit ice if'{ ! command -v starship 1>/dev/null }'
zinit light 'romkatv/powerlevel10k'

# vim 按键模式
zinit wait lucid for \
  atinit'bindkey -v' \
    'jeffreytse/zsh-vi-mode'

# fzf 补全列表
zinit wait lucid for \
  atload'
    zstyle ":completion:*:git-checkout:*" sort false
    zstyle ":completion:*:descriptions" format "[%d]"
    zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
    zstyle ":fzf-tab:complete:cd:*" fzf-preview "eza -1 --color=always $realpath"
    zstyle ":fzf-tab:*" switch-group "," "."
  ' \
  'Aloxaf/fzf-tab'

# 命令高亮提示与命令自动建议
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
  atinit'
    typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    typeset -g ZSH_AUTOSUGGEST_MANUAL_REBIND=0
    typeset -g ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
  ' \
    zsh-users/zsh-autosuggestions
