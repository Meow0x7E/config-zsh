#!/usr/bin/zsh

# 替换 ls 和 tree
{
    typeset -a LS_OPTIONS=(
        '--color=auto'
    )

    typeset -a EZA_OPTIONS=(
        '--color=auto'
        '--color-scale=size'
        '--color-scale-mode=gradient'
        '--icons=auto'
        '--binary' # 列出带二进制前缀的文件大小
        '--group' # 列出每个文件的组
        '--header' # 为每列添加标题行
        '--git'
    )

    if { 1>&- which eza } {
        alias 'ls'="eza ${EZA_OPTIONS}"
        alias 'll'="eza ${EZA_OPTIONS} -l"
        alias 'la'="eza ${EZA_OPTIONS} -a"
        alias 'all'="eza ${EZA_OPTIONS} -al"
        alias 'All'="eza ${EZA_OPTIONS} -aal"

        alias 'tree'="eza ${EZA_OPTIONS} -T"
    } elif { 1>&- which ls } {
        alias 'ls'="ls ${LS_OPTIONS}"
        alias 'll'="ls ${LS_OPTIONS} -l"
        alias 'la'="ls ${LS_OPTIONS} -A"
        alias 'all'="ls ${LS_OPTIONS} -Al"
        alias 'All'="ls ${LS_OPTIONS} -al"
    }
}

# 替换 tree
# 如果 eza 存在则跳过
if { ! which eza 1>&- } && { 1>&- which tree } {
    typeset -a OPTIONS=(
        '-h'
        '--du'
        '--dirsfirst'
        '--sort=name'
        '-A'
        '-C'
    )

    alias 'tree'="tree ${OPTIONS}"
}

# 替换 cd
if { 1>&- which zoxide } {
    eval "$(zoxide init --cmd cd zsh)"
}

if { 1>&- which sudo } {
    alias 'sudo'='sudo '
}

if { 1>&- which nvim } {
    alias 'vi'='nvim '
}

# 事实上我很少会误输入这个，我会在按回车前发现自己的 ls 反了，而且我更习惯使用 all
if { 1>&- which sl } {
    alias 'sl'='sl -ce3'
}
