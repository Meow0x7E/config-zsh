#!/usr/bin/zsh

alias 'ls'='ls --color=auto'
alias 'll'='ls --color=auto -l'
alias 'la'='ls --color=auto -A'
alias 'all'='ls --color=auto -Al'
# 有种在大声嚷嚷着要全部展示出来的感觉
alias 'All'='ls --color=auto -al'

if [[ -x '/usr/bin/sudo' ]] {
    alias 'sudo'='/usr/bin/sudo '
}

if [[ -x '/usr/bin/nvim' ]] {
    alias 'vi'='/usr/bin/nvim '
}

# 事实上我很少会误输入这个，我会在按回车前发现自己的 ls 反了，而且我更习惯使用 all
if [[ -x '/usr/bin/sl' ]] {
    alias 'sl'='sl -ce3'
}

if [[ -x '/usr/bin/tree' ]] {
    alias 'tree'='tree -ACch '
}
