#!/usr/bin/zsh

if { 1>&- which motd } {
    # 如果卡死在这里，可以挂起它，然后 kill %motd 来结束它
    zsh "$(which -p motd)"
}
