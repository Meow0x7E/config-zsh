#!/usr/bin/zsh

if { ! 1>&- which eza && 1>&- which tree } {
    typeset -a TREE_OPTIONS=(
        '-h'
        '--du'
        '--dirsfirst'
        '--sort=name'
        '-A'
        '-C'
    )

    alias 'tree'="tree ${TREE_OPTIONS}"
}
