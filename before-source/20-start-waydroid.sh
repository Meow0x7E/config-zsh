#!/usr/bin/zsh

if { 1>&- which waydroid } {
    function start-waydroid() {
        tmux has-session -t waydroid 1>/dev/null 2>/dev/null || tmux new-session -d -s waydroid
    }
}
