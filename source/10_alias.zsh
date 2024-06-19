#!/usr/bin/zsh

alias 'ls'='ls --color=auto'
alias 'll'='ls --color=auto -l'
alias 'la'='ls --color=auto -A'
alias 'all'='ls --color=auto -Al'
#有种在大声嚷嚷着要全部展示出来的感觉
alias 'All'='ls --color=auto -al'

[[ -x "/usr/bin/sudo" ]] && alias 'sudo'='/usr/bin/sudo '
[[ -x "/usr/bin/nvim" ]] && alias 'vi'='/usr/bin/nvim '
[[ -x "/usr/bin/sl" ]] && alias 'sl'='sl -ce3'
