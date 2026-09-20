if command -v starship 1>/dev/null; then
  typeset -gx STARSHIP_CONFIG="${ZSH_CONFIG_HOME}/starship.toml"
  eval "$(starship init zsh)"
fi
