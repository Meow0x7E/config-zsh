#!/usr/bin/zsh

if { ! 1>/dev/null which eza && 1>/dev/null which tree } {
  typeset -a TREE_OPTIONS=(
    '-h'
    '--du'
    '--dirsfirst'
    '--sort=name'
    '-A'
    '-C'
  )

  alias 'tree'="tree ${TREE_OPTIONS}"

  unset TREE_OPTIONS
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
