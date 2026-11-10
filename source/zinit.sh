#!/usr/bin/zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# PowerLevel10K 主题
# 仅在 starship 未安装时加载
zinit if'! command -v starship 1>/dev/null' for 'romkatv/powerlevel10k'

# 额外补全定义
zinit wait'0a' lucid for \
	blockf \
	'zsh-users/zsh-completions'
zinit wait'0b' lucid for \
	atinit'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' \
	'zdharma-continuum/null'

# fzf 补全选择菜单
zinit wait'0c' lucid has'fzf' for \
	atload'
    zstyle ":completion:*:git-checkout:*" sort false
    zstyle ":completion:*:descriptions" format "[%d]"
    zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
    zstyle ":fzf-tab:complete:cd:*" fzf-preview "eza -1 --color=always $realpath"
    zstyle ":fzf-tab:*" switch-group "," "."
  ' \
	'Aloxaf/fzf-tab'

# 语法高亮
zinit wait'1a' lucid for \
	atload'
    # 通知 MamoruDS/zsh-history-fuzzy-search 可以使用 fsh 进行高亮渲染
    typeset -g ZSH_HISTORY_FUZZY_SEARCH_FSH_PREVIEW=1
  ' \
	'zdharma-continuum/fast-syntax-highlighting'

# 补全建议
zinit wait'1a' lucid for \
	atload'!_zsh_autosuggest_start' \
	atinit'
    typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    typeset -g ZSH_AUTOSUGGEST_MANUAL_REBIND=0
    typeset -g ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
  ' \
	'zsh-users/zsh-autosuggestions'

# vim 按键模式
zinit wait'1c' lucid for \
	atinit'bindkey -v' \
	'jeffreytse/zsh-vi-mode'

# fzf 历史查找
zinit wait'1c' lucid has'fzf' for \
	atload'
    typeset -g ZSH_HISTORY_FUZZY_SEARCH_SHOW_DATES=1
    typeset -g ZSH_HISTORY_FUZZY_SEARCH_SHOW_EVENT_NUMBERS=1
    typeset -g ZSH_HISTORY_FUZZY_SEARCH_REMOVE_DUPLICATES=1
  ' \
	'MamoruDS/zsh-history-fuzzy-search'
