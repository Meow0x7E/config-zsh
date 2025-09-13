#!/usr/bin/zsh

if { 1>/dev/null which ollama } {
  function ollama() {
    typeset -a bwrap_options=(
      --ro-bind / /
      --tmpfs "${HOME}"
      --
      /usr/bin/ollama
    )

    bwrap ${bwrap_options} $@
  }
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
