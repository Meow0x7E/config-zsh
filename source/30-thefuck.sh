#!/usr/bin/zsh

if { 1>/dev/null which thefuck } {
  eval "$(thefuck --alias)"
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
