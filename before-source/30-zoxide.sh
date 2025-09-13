#!/usr/bin/zsh

if { 1>/dev/null which zoxide } {
  eval "$(zoxide init --cmd cd zsh)"
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
