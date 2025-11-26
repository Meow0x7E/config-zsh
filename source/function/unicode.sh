#!/usr/bin/zsh

# 将输入字符串转换为 Unicode 转义序列
#
# 该函数将输入文本转换为 Unicode 转义序列格式(如 \u4F60\u597D)，
#
# 处理流程:
#   1. 将文本转换为 UCS-2BE 编码(大端序的 Unicode 编码)
#   2. 使用 xxd 将二进制转换为十六进制表示
#   3. 使用 sed 将每4位十六进制数字转换为 \uXXXX 格式
#
# 参数:
#   $1: 可选，要转换的字符串。如果未提供，则从标准输入读取
#
# 输出:
#   转换后的 Unicode 转义序列字符串
#
# 示例:
#   unicode "你好"           # 输出: \u4F60\u597D
#   echo "你好" | unicode    # 输出: \u4F60\u597D
#   unicode < textfile.txt   # 转换文件内容
function unicode() {
  # 判断是否有参数传入，有则处理参数，无则处理标准输入
  if [[ -n "$1" ]]; then
    echo -n "$1" # 输出参数内容(不换行)
  else
    cat                      # 从标准输入读取内容
  fi | iconv -t UCS-2BE |    # 转换为 UCS-2BE 编码(大端序)
    xxd -p |                 # 以纯十六进制格式输出
    sed -e 's/..../\\u\U&/g' # 每4个字符前添加\u并转换为大写
}
