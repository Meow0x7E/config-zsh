for f (${(f)"$(print -l ${ZSH_CONFIG_HOME}/source/*(.,@))"}) {
    if [[ -f $f && -r $f ]] {
        source "$f"
    }
}

[[ -x '/bin/zoxide' ]] && eval "$(zoxide init --cmd cd zsh)"

source ${ZSH_CONFIG_HOME}/zinit.zsh
zsh ${ZSH_CONFIG_HOME}/motd/motd.zsh
