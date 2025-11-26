#!/usr/bin/zsh

# 统计指定文件或目录的 MIME 类型数量
#
# 该函数使用 find 命令查找文件，分析每个文件的 MIME 类型，
# 并统计每种 MIME 类型的出现次数，按出现频率降序排列
#
# 参数:
#   $@: 传递给 find 命令的参数，可以是任何 find 支持的参数
#       如目录路径、文件名模式、查找条件等
#       默认情况下会查找当前目录中的所有文件
#
# 输出:
#   每行显示一种 MIME 类型的统计结果，格式为:
#     数量 MIME 类型
#
# 示例:
#   count-mime-types                 # 统计当前目录
#   count-mime-types ~/Documents     # 统计 Documents 目录
#   count-mime-types -name "*.txt"   # 统计所有 txt 文件
#   count-mime-types -type f -size +1M  # 统计大于1MB的文件
function count-mime-types() {
  # 使用 find 命令查找文件，参数直接传递给 find
  # 处理流程:
  #   1. find "$@": 使用提供的参数查找文件
  #   2. -exec file -b --mime-type {} "+": 对找到的每个文件获取 MIME 类型
  #   3. sort: 对 MIME 类型进行排序，为 uniq 命令准备
  #   4. uniq -c: 统计每种 MIME 类型的出现次数
  #   5. sort -rn: 按出现次数降序排列结果
  find "$@" -exec file -b --mime-type {} "+" | sort | uniq -c | sort -rn
}
