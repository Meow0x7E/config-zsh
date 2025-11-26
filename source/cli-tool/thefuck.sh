#!/usr/bin/zsh

if { 1>/dev/null which thefuck } {
  eval "$(thefuck --alias)"
}
