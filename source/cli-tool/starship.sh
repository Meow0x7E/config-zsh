#!/usr/bin/zsh

if { command -v starship 1>/dev/null; } {
  typeset -gx STARSHIP_CONFIG="${ZSH_CONFIG_HOME}/starship.toml"
  eval "$(starship init zsh)"
}
