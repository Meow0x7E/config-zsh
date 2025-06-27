#!/usr/bin/zsh

typeset -xA ZMC_DB=()

find "${ZMC_HOME}/before-source" -type f -name "*.sh" | sort -n | while {read -r file} {
    source $file
}

# ssh wrapper
if [[ "$(get-proc-name $PPID)" == "sshd-session" ]] {
    exec tmux -2 new-session -s "$(mktemp -u ssh-XXXXXX)"
}

find "${ZMC_HOME}/after-source" -type f -name "*.sh" | sort -n | while {read -r file} {
    source $file
}
