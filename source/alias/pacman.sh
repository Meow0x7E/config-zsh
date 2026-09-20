#!/usr/bin/zsh

# Termux 也可以选择更换为 pacman 包管，但不需要 root 所以得做出区分

if [[ "${(L)"$(uname -o)"}" != "android" ]] && ((UID != 0)) && { command -v pacman 1>/dev/null } {
  if { command -v sudo 1>/dev/null } {
    alias pacman='sudo pacman'
  } elif { command -v doas 1>/dev/null } {
    alias pacman='doas pacman'
  } elif { command -v pkexec 1>/dev/null } {
    alias pacman='pkexec pacman'
  }
}
