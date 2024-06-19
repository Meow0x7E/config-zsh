#!/usr/bin/zsh

typeset this="${0:A:h}"

local function get_operating_system() {
    print -n "$(hostnamectl | grep -e 'Operating System' | sed -e 's/Operating System: //' || uname -o)"
}

local function slow_scan_line_print_title(){
    for s (${(f)"$(<${this}/ascii/$(get_operating_system).txt)"}) {
        print "$s"
        sleep "0.01s"
    }
}

local function slow_scan_print_hitokoto() {
    local s="
$(. ${this}/hitokoto.zsh)
"
#猜猜我为啥换行:(
    for i ({1..${#s}}) {
        print -n $s[$i]
        sleep "0.01s"
    }
}

clear
print -n "[?25l"
# 这玩意真的很慢，我反正是不喜欢
#slow_scan_line_print_title | lolcat -F
fastfetch --pipe 0
slow_scan_print_hitokoto | lolcat -F
print -n "[?25h"
