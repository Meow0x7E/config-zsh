#!/usr/bin/zsh

if [[ -d "${HOME}/.Meow0x7E" ]] && { 1>/dev/null which git } {
  alias keep="git --git-dir=${HOME}/.Meow0x7E/ --work-tree=${HOME}"
  alias syskeep="git --git-dir=/.system --work-tree=/"
}
