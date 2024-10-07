#!/usr/bin/zsh

for f (${(f)"$(print -l ${ZSH_CONFIG_HOME}/source/*(.,@))"}) {
    if [[ -f $f && -r $f ]] {
        source "$f"
    }
}

source ${ZSH_CONFIG_HOME}/zinit.zsh

if { 1>&- which motd } {
    # 如果卡死在这里，可以挂起它，然后 kill % 来结束它
    ( motd )
}
