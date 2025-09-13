#!/usr/bin/zsh

# 输出格式化的错误消息到标准错误流(stderr)
#
# 该函数生成带有时间戳和颜色编码的错误消息，格式为:
# [ERROR][YYYY-MM-DD HH:MM:SS] message
#
# 参数:
#   $*: 错误消息内容，支持多个参数(会自动连接)
#
# 输出特性:
#   - ERROR 标签显示为红色
#   - 时间戳显示为绿色
#   - 消息内容保持默认颜色
#   - 所有输出定向到标准错误流(stderr)
function _error() {
  # 使用 print 命令输出格式化错误消息:
  #   -u 2: 指定输出到文件描述符 2 (stderr)
  #   -f: 使用格式化字符串
  #   格式化字符串包含:
  #     [\x1b[31mERROR\x1b[0m]: 红色 ERROR 标签(后跟颜色重置)
  #     [\x1b[32m%s\x1b[0m]: 绿色时间戳占位符(后跟颜色重置)
  #     %s: 错误消息占位符
  #   $(date '+%Y-%m-%d %H:%M:%S'): 生成格式化的时间戳
  #   "$*": 将所有参数连接为单个字符串作为错误消息
  print -u 2 -f "[\x1b[31mERROR\x1b[0m][\x1b[32m%s\x1b[0m]%s\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$*"
}

# 检查指定命令是否存在于系统 PATH 中
#
# 该函数是对 Shell 内建 `which` 命令的包装，提供更友好的错误处理和消息输出
# 当命令不存在时，会输出错误信息并返回非零状态码
#
# 参数:
#   $1: 必需，要检查的命令名称
#   $@: 可选，传递给 which 命令的附加参数
#
# 返回值:
#   0: 命令存在
#   1: 命令不存在
#
# 示例:
#   _which git      # 检查 git 命令是否存在
#   _which -a node  # 检查所有名为 node 的可执行文件
function _which() {
  local name="$1"  # 存储要检查的命令名称
  shift            # 从参数列表中移除第一个参数(命令名称)

  # 使用 which 命令检查命令是否存在
  # 重定向 stdout 到 /dev/null 以抑制正常输出
  # 保留 stderr 以便 which 命令可以显示错误信息
  if { ! 1>/dev/null which "$@" "$name" } {
    # 输出自定义错误信息
    _error "未找到命令 ${name}"
    return 1 # 返回非零状态码表示失败
  }

  # 隐式返回 0 (成功) 如果 which 命令执行成功
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
