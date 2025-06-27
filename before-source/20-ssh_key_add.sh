#!/usr/bin/zsh

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
