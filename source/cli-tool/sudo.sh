#!/usr/bin/zsh

if { 1>/dev/null which sudo } {
  alias 'sudo'='sudo '
  alias 'esudo'='sudo -E '
}
