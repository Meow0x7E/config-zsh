#!/usr/bin/zsh

# Termux 也可以选择更换为 pacman 包管，但不需要 root 所以得做出区分

if [[ "${(L)"$(uname -o)"}" != "android" ]] && ((UID != 0)) && { 1>/dev/null which pacman } {
  alias "pacman"="sudo pacman"
}
