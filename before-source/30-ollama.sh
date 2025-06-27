#!/usr/bin/zsh

if { 1>&- which ollama } {
    function ollama() {
        typeset -a BWRAP_OPTIONS=(
            --ro-bind / /
            --tmpfs "${HOME}"
            -- 
            /usr/bin/ollama
        )

        bwrap ${BWRAP_OPTIONS} $@
    }
}
