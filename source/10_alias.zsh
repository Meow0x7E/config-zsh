#!/usr/bin/zsh


# replace ls
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
        '--blocksize' # 显示已分配文件系统块的大小
        '--git' # 列出每个文件的 Git 状态(如果已跟踪或已忽略)
        '--git-repos' # list root of git-tree status

    )

    if { which eza } {
        alias 'ls'="eza ${EZA_OPTIONS}"
        alias 'll'="eza ${EZA_OPTIONS} -l"
        alias 'la'="eza ${EZA_OPTIONS} -a"
        alias 'all'="eza ${EZA_OPTIONS} -al"
        alias 'All'="eza ${EZA_OPTIONS} -aal"
    } elif { which ls } {
        alias 'ls'="ls ${LS_OPTIONS}"
        alias 'll'="ls ${LS_OPTIONS} -l"
        alias 'la'="ls ${LS_OPTIONS} -A"
        alias 'all'="ls ${LS_OPTIONS} -Al"
        alias 'All'="ls ${LS_OPTIONS} -al"
    }
}

if { which tree } {
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

# replace cd
if { which zoxide } {
    eval "$(zoxide init --cmd cd zsh)"
}

if { which sudo } {
    alias 'sudo'='sudo '
}

if { which nvim } {
    alias 'vi'='nvim '
}

# 事实上我很少会误输入这个，我会在按回车前发现自己的 ls 反了，而且我更习惯使用 all
if { which sl } {
    alias 'sl'='sl -ce3'
}
