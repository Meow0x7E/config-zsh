#!/usr/bin/zsh

# 没有 eza 时的备选
if { ! 1>/dev/null which eza } {
    typeset -a LS_OPTIONS=(
        '--color=auto'
    )

    alias 'ls'="ls ${LS_OPTIONS}"
    alias 'll'="ls ${LS_OPTIONS} -l"
    alias 'la'="ls ${LS_OPTIONS} -A"
    alias 'all'="ls ${LS_OPTIONS} -Al"
    alias 'All'="ls ${LS_OPTIONS} -al"

    unset LS_OPTIONS
}
