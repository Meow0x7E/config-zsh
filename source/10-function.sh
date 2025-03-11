#!/usr/bin/zsh

function window_center_calc() {
    print "$((($1 - $3) / 2))x$((($2 - $4) / 2))"
}

function ssh_key_add() {
    typeset -a keys=()

    # 查找密钥文件
    find "${HOME}/.ssh/" -type f -name "*.pub" | while {read -r file} {
        keys+="${file:r}"
    }

    eval "$(ssh-agent)"

    while {print -l $keys | fzf --preview="ssh-keygen -lvf {}" | read -r key_file} {
        ssh-add "$key_file"
        typeset -i index=${keys[(I)$key_file]}
        (( index > 0 )) && keys[$index]=()
    }
}

# 将死妈 RPG 服务器的数据通过黑洞路由丢弃，这样游戏就不知道有这个服务器，自然不会匹配到了
# 该方法具备 bash 兼容
function fuck_l4d2_rpg() {
    if [[ -z "$1" ]]; then
        echo "请传入一个包含了 RPG 服务器列表的文件"
        exit 1
    fi

    # 清理旧的规则
    ip route show type blackhole | cut -d ' ' -f 2 | while read -r ip; do
        sudo ip route delete $ip
    done

    # 添加新的规则
    jq --raw-output '.data | .[] | .raddr' "$1" | while read -r ip; do
        sudo ip route add blackhole $ip # 数据包会被静默丢弃，本地发送者会收到一个 EINVAL 错误
    done
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
