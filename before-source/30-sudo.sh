#!/usr/bin/zsh

if { 1>&- which sudo } {
    alias 'sudo'='sudo '
    alias 'esudo'='sudo -E '
}
