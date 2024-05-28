#!/usr/bin/zsh

# 把输入字符串转换为 Unicode 转义序列
# 该方法具备 bash 兼容
function unicode() {
    if [[ -n "$1" ]]; then
        echo -n "$1"
    else
        cat
    fi | iconv -t UCS-2BE | xxd -p | sed -e 's/..../\\u\U&/g'
}
