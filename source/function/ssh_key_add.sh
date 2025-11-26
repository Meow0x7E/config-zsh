#!/usr/bin/zsh

# 通过 FZF 交互式选择并添加 SSH 私钥到 SSH 代理
#
# 该函数自动扫描 ~/.ssh 目录下的所有公钥文件(.pub)，提取对应的私钥路径，
# 使用 FZF 提供交互式选择界面，并可将选中的私钥添加到 SSH 代理中
#
# 特性:
#   - 自动启动 SSH 代理(如果未运行)
#   - 使用 FZF 提供带预览的交互式选择界面
#   - 添加后从待选列表中移除已添加的密钥
#
# 依赖:
#   - fzf: 模糊查找工具
#   - ssh-agent: SSH 密钥管理代理
#   - ssh-add: SSH 密钥添加工具
#   - ssh-keygen: SSH 密钥管理工具
#
# 返回值:
#   0: 成功执行
#   1: 缺少必要依赖(fzf 或 ssh-agent)
function ssh_key_add() {
  # 检查必要依赖是否可用
  _which fzf || return 1
  _which ssh-agent || return 1
  _which ssh-keygen || return 1
  _which ssh-add || return 1

  local -a keys=()  # 声明数组存储私钥路径

  # 查找所有公钥文件(.pub)，提取对应的私钥路径(去除.pub扩展名)
  # 注意: 此方法假设私钥与公钥同名但无.pub扩展名
  find "${HOME}/.ssh/" -type f -name "*.pub" | while { read } {
    keys+="${REPLY:r}"  # 移除.pub扩展名，获得私钥路径
  }

  # 检查 SSH 代理是否运行，如果没有则启动
  if [[ -z "$SSH_AUTH_SOCK" || -z "$SSH_AGENT_PID" ]] {
    eval "$(ssh-agent)"
  }

  # 使用 FZF 交互式选择要添加的密钥
  # 预览功能显示密钥的指纹和详细信息
  while { print -l $keys | fzf --preview="ssh-keygen -lvf {}" | read } {
    # 将选中的私钥添加到 SSH 代理
    ssh-add "$REPLY"

    # 从待选列表中移除已添加的密钥
    typeset -i index=${keys[(I)$REPLY]}  # 查找密钥在数组中的索引
    (( index > 0 )) && keys[$index]=()   # 如果找到则从数组中移除
  }
}
