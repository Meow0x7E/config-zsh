#!/usr/bin/zsh

# 可以更方便的把 ssh-agent 放进后台，并导入密钥
function ssh_key_add() {
    typeset -a keys=()

    # 查找密钥文件
    find "${HOME}/.ssh/" -type f -name "*.pub" | while {read -r file} {
        keys+="${file:r}"
    }

    if [[ -z "$SSH_AUTH_SOCK" || -z "$SSH_AGENT_PID" ]] {
        eval "$(ssh-agent)"
    }

    while {print -l $keys | fzf --preview="ssh-keygen -lvf {}" | read -r key_file} {
        ssh-add "$key_file"
        typeset -i index=${keys[(I)$key_file]}
        (( index > 0 )) && keys[$index]=()
    }
}

# 把输入字符串转换为 Unicode
# 该方法具备 bash 兼容
function unicode() {
    if [[ -n "$1" ]]; then
        echo -n "$1"
    else
        cat
    fi | iconv -t UCS-2BE | xxd -p | sed 's/..../\\u&/g'
}
