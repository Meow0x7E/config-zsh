#!/usr/bin/bash

if ! command -v eza 1>/dev/null; then
  alias 'ls'="ls --color=auto"
  alias 'll'="ls --color=auto -l"
  alias 'la'="ls --color=auto -A"
  alias 'all'="ls --color=auto -Al"
  alias 'All'="ls --color=auto -al"
else
  typeset -a eza_options=(
    --classify='auto'
    --color="auto"
    --color-scale="size"
    --color-scale-mode="gradient"
    --icons="auto"
    --sort="type"
    --binary
    --smart-group
    --header
    --mounts
    --time-style="$'+%F %T%z\n%m-%d %T'"
  )

  # shellcheck disable=SC2139
  {
    alias ls="eza ${eza_options[*]}"
    alias ll="eza ${eza_options[*]} --long"
    alias la="eza ${eza_options[*]} --all"
    alias all="eza ${eza_options[*]} --all --long"
    alias All="eza ${eza_options[*]} --all --all --long"
    alias tree="eza ${eza_options[*]} --tree"
  }
  unset eza_options
fi
