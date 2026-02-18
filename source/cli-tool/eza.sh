#!/usr/bin/zsh

if { 1>/dev/null which eza } {
  local -a eza_options=(
    # ========== 显示选项 ==========

    # 有效设置包括“always”（始终）、“automatic”（自动，可简写为“auto”）和“never”（从不）。
    # 当使用时不指定值时，默认为“automatic”。
    # “automatic”或“auto”模式表示：仅当标准输出连接到真实终端时，才显示文件类型指示符。
    #   如果 eza 在 tty 终端中运行，或者 eza 的输出被重定向到文件或通过管道传输给另一个程序，则不会使用文件类型指示符。
    #   将此项设置为“always”会强制 eza 始终显示文件类型指示符，而设置为“never”则会禁用文件类型指示符。
    --classify='auto'

    # 何时使用终端颜色（使用 ANSI 转义码为输出着色）。
    # 有效设置包括：
    #   “always”（始终）
    #   “automatic”（自动，可简写为“auto”）
    #   “never”（从不）
    # 当使用时不指定值时，默认为“automatic”。
    # 默认行为（“automatic”或“auto”）是：
    #   仅当标准输出连接到真实终端时，才为输出着色。
    #   如果 eza 的输出被重定向到文件或通过管道传输给另一个程序，则不会使用终端颜色。
    #   将此项设置为“always”会强制 eza 始终输出终端颜色，而设置为“never”则会禁用终端颜色的使用。
    # 手动设置此选项将覆盖 NO_COLOR 环境变量。
    --color="auto"
    # 突出显示字段的不同级别。使用逗号（,）分隔的列表，可选值为 all、age、size。
    --color-scale="size"
    # 在 --color-scale 中使用渐变颜色或固定颜色。
    # 有效选项为 fixed 或 gradient。当使用时不指定值时，默认为 gradient。
    --color-scale-mode="gradient"
    # 在文件名旁显示图标。
    # 有效设置包括：
    #   “always”（始终）
    #   “automatic”（自动，可简写为“auto”）
    #   “never”（从不）
    # 当使用时不指定值时，默认为“automatic”。
    # “automatic”或“auto”模式表示：仅当标准输出连接到真实终端时，才显示图标。
    #   如果 eza 在 tty 终端中运行，或者 eza 的输出被重定向到文件或通过管道传输给另一个程序，则不会使用图标。
    #   将此项设置为“always”会强制 eza 始终显示图标，而设置为“never”则会禁用图标的使用。
    --icons="auto"

    # ========== 筛选和排序选项 ==========

    --sort="type"

    # ========== 长视图选项 ==========

    --binary        # 列出带二进制前缀的文件大小。
    #--group        # 列出每个文件的组。
    --smart-group   # 只有当该组的名称与所有者不同时才使用。
    --header        # 为每列添加标题行。
    #--links        # 列出每个文件的硬链接数量。
    #--inode        # 列出每个文件的inode编号。
    --mounts        # 显示挂载详细信息（仅适用于 Linux 和 Mac）
    # 如何格式化时间戳。
    # 有效的时间戳样式包括：
    #   'default'（默认）
    #   'iso'（国际标准化组织格式）
    #   'long-iso'（长iso格式）
    #   'full-iso'（完整iso格式）
    #   'relative'（相对格式）
    #   或自定义样式 '+<FORMAT>'（例如，'+%Y-%m-%d %H:%M' 会显示为 '2023-09-30 13:00'）。
    # <FORMAT> 应为一个时间格式字符串。
    # 有关时间格式语法的详细信息，请阅读：https://docs.rs/chrono/latest/chrono/format/strftime/index.html 。
    # 此外，<FORMAT> 也可以是一个两行的字符串，第一行将用于非近期文件，第二行用于近期文件。
    # 例如，如果 <FORMAT> 是 "%Y-%m-%d %H<newline>--%m-%d %H:%M"，
    # 那么非近期文件将显示为 "2022-12-30 13"，近期文件将显示为 "--09-30 13:34"。
    --time-style="$'+%F %T%z\n%m-%d %T'"
    # 如果文件被跟踪，列出每个文件的 Git 状态。
    # 这会添加一个两字符列，分别表示暂存状态和未暂存状态。
    # 状态字符可以是：
    #   ‘-’ 表示未修改
    #   ‘M’ 表示文件已修改
    #   ‘N’ 表示新文件
    #   ‘D’ 表示已删除
    #   ‘R’ 表示已重命名
    #   ‘T’ 表示类型更改
    #   ‘I’ 表示被忽略
    #   ‘U’ 表示存在冲突
    # 目录将显示其内容的 Git 状态，这就是为什么目录可能显示“删除”状态——如果目录包含具有某种状态的文件，它将显示该状态。
    --git
    # 如果目录被跟踪，列出每个目录的 Git 状态。显示的符号：|= 表示干净，+= 表示有修改，~= 表示未知。
    --git-repos
    # 列出目录是否为 Git 仓库，但不显示其状态。所有 Git 仓库目录将显示为（主题样式）“-”，不指示状态。
    --git-repos-no-status
  )

  alias ls="eza ${eza_options}"
  alias ll="eza ${eza_options} --long"
  alias la="eza ${eza_options} --all"
  alias all="eza ${eza_options} --all --long"
  alias All="eza ${eza_options} --all --all --long"

  alias tree="eza ${eza_options} --tree"

  unset eza_options
}
