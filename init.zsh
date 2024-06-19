#!/usr/bin/zsh

for f (${(f)"$(print -l ${ZSH_CONFIG_HOME}/source/*(.,@))"}) {
    if [[ -f $f && -r $f ]] {
        source "$f"
    }
}

if [[ -x '/bin/zoxide' ]] {
    eval "$(zoxide init --cmd cd zsh)"
}

source ${ZSH_CONFIG_HOME}/zinit.zsh
if [[ -x '/usr/bin/motd' ]] {
    motd
}
