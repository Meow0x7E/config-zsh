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

    if [[ -x '/usr/bin/eza' ]] {
        alias 'ls'="/usr/bin/eza ${EZA_OPTIONS}"
        alias 'll'="/usr/bin/eza ${EZA_OPTIONS} -l"
        alias 'la'="/usr/bin/eza ${EZA_OPTIONS} -a"
        alias 'all'="/usr/bin/eza ${EZA_OPTIONS} -al"
        alias 'All'="/usr/bin/eza ${EZA_OPTIONS} -aal"
    } elif [[ -x "/usr/bin/ls" ]] {
        alias 'ls'="/usr/bin/ls ${LS_OPTIONS}"
        alias 'll'="/usr/bin/ls ${LS_OPTIONS} -l"
        alias 'la'="/usr/bin/ls ${LS_OPTIONS} -A"
        alias 'all'="/usr/bin/ls ${LS_OPTIONS} -Al"
        alias 'All'="/usr/bin/ls ${LS_OPTIONS} -al"
    }
}

if [[ -x '/usr/bin/tree' ]] {
    alias 'tree'='tree -h --du --dirsfirst --sort name -A -C'
}

# replace cd
if [[ -x '/bin/zoxide' ]] {
    eval "$(zoxide init --cmd cd zsh)"
}

if [[ -x '/usr/bin/sudo' ]] {
    alias 'sudo'='/usr/bin/sudo '
}

if [[ -x '/usr/bin/nvim' ]] {
    alias 'vi'='/usr/bin/nvim '
}

# 事实上我很少会误输入这个，我会在按回车前发现自己的 ls 反了，而且我更习惯使用 all
if [[ -x '/usr/bin/sl' ]] {
    alias 'sl'='sl -ce3'
}
