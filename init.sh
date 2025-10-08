#!/usr/bin/zsh

find "${ZSH_CONFIG_HOME}/before-source" -type f -name "*.sh" | sort -n | while {read -r file} {
  source $file
}

# ssh wrapper
if { 1>/dev/null which tmux } && [[ "$(get-proc-name $PPID)" == "sshd-session" ]] {
  exec tmux -2 new-session -s "$(mktemp -u ssh-XXXXXX)"
}

find "${ZSH_CONFIG_HOME}/after-source" -type f -name "*.sh" | sort -n | while {read -r file} {
  source $file
}

(fastfetch --pipe 0 | slow-scan-print -d 16ms -l -i)

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
