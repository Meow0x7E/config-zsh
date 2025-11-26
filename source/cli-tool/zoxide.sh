#!/usr/bin/zsh

if { 1>/dev/null which zoxide } {
  eval "$(zoxide init --cmd cd zsh)"
}
