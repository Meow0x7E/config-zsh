#!/usr/bin/zsh

if { 1>/dev/null which starship } {
  zinit unload -q romkatv/powerlevel10k
  typeset -gx STARSHIP_CONFIG="${ZSH_CONFIG_HOME}/starship.toml"
  eval "$(starship init zsh)"
}
