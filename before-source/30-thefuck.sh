#!/usr/bin/zsh

if { 1>&- which thefuck } {
    eval "$(thefuck --alias)"
}
