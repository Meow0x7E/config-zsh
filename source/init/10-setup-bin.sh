if [[ -d "${ZSH_CONFIG_HOME}/bin" ]]; then
  find "${ZSH_CONFIG_HOME}/bin" -maxdepth 1 -type f ! -perm -0100 -exec chmod u+x {} +
  typeset -gx PATH="${PATH}:${ZSH_CONFIG_HOME}/bin"
fi
