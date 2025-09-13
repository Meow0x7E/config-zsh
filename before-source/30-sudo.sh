#!/usr/bin/zsh

if { 1>/dev/null which sudo } {
  alias 'sudo'='sudo '
  alias 'esudo'='sudo -E '
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
