#!/usr/bin/zsh

# 获取指定进程 ID 的进程名称
#
# 该函数通过读取 Linux /proc 文件系统中进程的状态信息来获取进程名称
#
# 参数:
#   $1: 必需，进程 ID (PID)
#
# 返回值:
#   成功: 输出进程名称并返回 0
#   失败: 如果进程不存在或无法访问 /proc，可能产生错误并返回非零状态码
#
# 示例:
#   get-proc-name 1234  # 获取 PID 为 1234 的进程名称
function get-proc-name() {
  # 读取指定进程的状态信息第一行(包含进程名称)
  # 使用 sed 移除 "Name:\t" 前缀，只保留进程名称
  head -n 1 /proc/$1/status | sed -e 's/Name:\t//'
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
