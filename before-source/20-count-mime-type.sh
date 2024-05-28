#!/usr/bin/zsh

##
# 统计文件系统中指定文件的 MIME 类型分布
#
# 本函数本质上是向 `find` 命令传递参数，因此支持所有 `find` 支持的选项和表达式（如 `-name`, `-type`, `-maxdepth` 等），
# 但应避免使用 `-print` 或 `-exec` 等动作参数，以免覆盖默认的 MIME 类型检测行为。
#
# 功能:
#   递归查找文件并检测其 MIME 类型，统计每种类型出现的次数，结果按频率降序排列
#
# 参数:
#   $@: 传递给 `find` 命令的完整参数集，可包含：
#       - 路径: 默认为当前目录 (.)
#       - 测试表达式: -name '*.txt', -type f, -mtime -7 等
#       - 选项: -L (跟随符号链接), -maxdepth 2 等
#
# 输出格式:
#   [出现次数] [MIME类型]
#   示例: "42 text/plain"
#
# 使用示例:
#   # 统计当前目录
#   count-mime-types
#
#   # 统计指定目录下的图片文件
#   count-mime-types ~/Pictures -name '*.jp*g' -o -name '*.png'
#
#   # 统计最近修改的文本文件 (排除目录)
#   count-mime-types /var/log -type f -mtime -1 -name '*.log'
#
#   # 多条件组合搜索 (注意使用括号需转义)
#   count-mime-types \( -name '*.php' -o -name '*.html' \) -size +1k
#
# 实现说明:
#   1. find: 使用传入参数定位文件
#   2. file -b --mime-type: 检测实际MIME类型(非扩展名)
#   3. sort | uniq -c: 计数同类项
#   4. sort -rn: 按频率降序排列
##
function count-mime-types() {
    find $@ -exec file -b --mime-type {} \; | sort | uniq -c | sort -rn
}
