#!/usr/bin/zsh

find "${ZSH_CONFIG_HOME}/before-source" -type f | sort -n | while {read -r file} {
    source $file
}

# ssh wrapper
if [[ "$(get_proc_name $PPID)" == "sshd-session" ]] {
    exec tmux -2 new-session -s "$(mktemp -u ssh-XXXXXX)"
}

find "${ZSH_CONFIG_HOME}/after-source" -type f | sort -n | while {read -r file} {
    source $file
}
