#!/usr/bin/zsh

typeset -a zinit_options=(
  lucid
  depth'1'
  for
    # 主题
    light-mode
      'romkatv/powerlevel10k'

    # 命令高亮提示
    light-mode
      'zsh-users/zsh-syntax-highlighting'

    # vim 按键模式
    light-mode
      atinit'bindkey -v'
      'jeffreytse/zsh-vi-mode'

    # fzf 补全列表
    light-mode
      atload"
        zstyle ':completion:*:git-checkout:*' sort false
        zstyle ':completion:*:descriptions' format '[%d]'
        zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
        zstyle ':fzf-tab:*' switch-group ',' '.'
      "
      'Aloxaf/fzf-tab'

    # 类似 fish 的自动补全
    light-mode
      atinit"
        typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
        typeset -g ZSH_AUTOSUGGEST_MANUAL_REBIND=0
        typeset -g ZSH_AUTOSUGGEST_HISTORY_IGNORE=\'?(#c50,)\'
      "
      'zsh-users/zsh-autosuggestions'
)

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit $zinit_options

unset zinit_options

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
