#!/usr/bin/zsh

function load-config() {
  find "$@" \
    -type f \
    -name "*.sh" |
    sort -n |
    while { read } {
      source "$REPLY"
    }
}

source "${ZSH_CONFIG_HOME}/source/tmux-or-motd.sh"
load-config \
  "${ZSH_CONFIG_HOME}/source/init" \
  "${ZSH_CONFIG_HOME}/source/environment-variable"
source "${ZSH_CONFIG_HOME}/source/zinit.sh"
load-config "${ZSH_CONFIG_HOME}/source/alias" \
  "${ZSH_CONFIG_HOME}/source/function" \
  "${ZSH_CONFIG_HOME}/source/cli-tool"
source "${ZSH_CONFIG_HOME}/source/zinit-after.sh"

unfunction load-config
