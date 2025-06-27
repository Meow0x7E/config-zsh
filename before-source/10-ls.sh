#!/usr/bin/zsh

typeset -a LS_OPTIONS=(
    '--color=auto'
)

if { ! 1>&- which eza } {
    alias 'ls'="ls ${LS_OPTIONS}"
    alias 'll'="ls ${LS_OPTIONS} -l"
    alias 'la'="ls ${LS_OPTIONS} -A"
    alias 'all'="ls ${LS_OPTIONS} -Al"
    alias 'All'="ls ${LS_OPTIONS} -al"
}
