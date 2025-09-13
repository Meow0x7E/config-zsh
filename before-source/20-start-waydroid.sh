#!/usr/bin/zsh

# 在 tmux 会话中启动或附加到 Waydroid 会话
#
# 该函数确保 Waydroid 在一个持久的 tmux 会话中运行，便于管理和后台运行
# 如果指定的 tmux 会话不存在，则会创建新的分离会话
#
# 依赖:
#   - tmux: 终端多路复用器
#   - waydroid: Android 容器实现
#
# 返回值:
#   0: 成功检查依赖并确保会话存在
#   1: 缺少必要依赖(tmux 或 waydroid)
#
# 示例:
#   start-waydroid  # 确保 waydroid tmux 会话存在
function start-waydroid() {
  # 检查必要依赖是否可用
  _which tmux || return 1
  _which waydroid || return 1

  # 检查是否已存在名为 "waydroid" 的 tmux 会话
  # 如果不存在，则创建新的分离会话
  # has-session 命令检查会话是否存在，输出重定向到 /dev/null 以保持安静
  tmux has-session -t waydroid 1>/dev/null 2>/dev/null || tmux new-session -d -s waydroid
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
