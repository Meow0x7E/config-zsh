#!/usr/bin/zsh

if [[ -d "${HOME}/.Meow0x7E" ]] && { 1>/dev/null which git } {
  alias config="git --git-dir=${HOME}/.Meow0x7E/ --work-tree=${HOME}"
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
