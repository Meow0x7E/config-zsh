#!/usr/bin/zsh

if { 1>/dev/null which bat } {
    local -a bat_options=(
        --nonprintable-notation unicode
    )

    alias cat="bat ${bat_options}"

    unset bat_options
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
