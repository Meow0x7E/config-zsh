#!/usr/bin/zsh

# 将死妈 RPG 服务器的数据通过黑洞路由丢弃，这样游戏就不知道有这个服务器，自然不会匹配到了
# 该方法具备 bash 兼容
function fuck-l4d2-rpg() {
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
