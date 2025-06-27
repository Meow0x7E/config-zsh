#!/usr/bin/zsh

if { 1>&- which zoxide } {
    eval "$(zoxide init --cmd cd zsh)"
}
