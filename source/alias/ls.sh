#!/usr/bin/zsh

# 没有 eza 时的备选
if { ! 1>/dev/null which eza } {
    local -a ls_options=(
        '--color=auto'
    )

    alias 'ls'="ls ${ls_options}"
    alias 'll'="ls ${ls_options} -l"
    alias 'la'="ls ${ls_options} -A"
    alias 'all'="ls ${ls_options} -Al"
    alias 'All'="ls ${ls_options} -al"

    unset ls_options
}
