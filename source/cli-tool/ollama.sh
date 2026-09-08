#!/usr/bin/zsh

if { 1>/dev/null which ollama } {
  function ollama() {
    local -a bwrap_options=(
      --ro-bind / /
      --tmpfs "${HOME}"
      --
      /usr/bin/ollama
    )

    bwrap ${bwrap_options} $@
  }
}
