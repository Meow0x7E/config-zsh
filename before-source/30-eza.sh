#!/usr/bin/zsh

if { 1>&- which eza } {
    typeset -a EZA_OPTIONS=(
        '--color=auto'
        '--color-scale=size'
        '--color-scale-mode=gradient'
        '--icons=auto'
        '--binary' # 列出带二进制前缀的文件大小
        '--group'  # 列出每个文件的组
        '--header' # 为每列添加标题行
        '--git'
    )

    alias 'ls'="eza ${EZA_OPTIONS}"
    alias 'll'="eza ${EZA_OPTIONS} -l"
    alias 'la'="eza ${EZA_OPTIONS} -a"
    alias 'all'="eza ${EZA_OPTIONS} -al"
    alias 'All'="eza ${EZA_OPTIONS} -aal"

    alias 'tree'="eza ${EZA_OPTIONS} -T"

    unset EZA_OPTIONS
}
