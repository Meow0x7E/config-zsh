#!/usr/bin/zsh

if { 1>&- which bat } {
    typeset -a BAT_OPTIONS=(
        --nonprintable-notation unicode
    )

    alias 'cat'="bat ${BAT_OPTIONS}"

    unset BAT_OPTIONS
}
