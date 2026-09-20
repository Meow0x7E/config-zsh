#!/usr/bin/zsh

function load-config() {
  local it
  for it ($@) {
    if [[ -f "$it" ]] {
      source "$it"
      continue
    }

    for it ("$it"/*.sh(N)) {
      source "$it"
    }
  }
}

load-config \
  "${ZSH_CONFIG_HOME}/source/init" \
  "${ZSH_CONFIG_HOME}/source/environment-variable" \
  "${ZSH_CONFIG_HOME}/source/zinit.sh" \
  "${ZSH_CONFIG_HOME}/source/alias" \
  "${ZSH_CONFIG_HOME}/source/builtin-replace" \
  "${ZSH_CONFIG_HOME}/source/function" \
  "${ZSH_CONFIG_HOME}/source/cli-tool"

unfunction load-config
