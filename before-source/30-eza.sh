#!/usr/bin/zsh

if { 1>/dev/null which eza } {
  local -a eza_options=(
    '--color=auto'
    '--color-scale=size'
    '--color-scale-mode=gradient'
    '--icons=auto'
    '--binary' # 列出带二进制前缀的文件大小
    '--group'  # 列出每个文件的组
    '--header' # 为每列添加标题行
    '--git'
  )

  alias 'ls'="eza ${eza_options}"
  alias 'll'="eza ${eza_options} -l"
  alias 'la'="eza ${eza_options} -a"
  alias 'all'="eza ${eza_options} -al"
  alias 'All'="eza ${eza_options} -aal"

  alias 'tree'="eza ${eza_options} -T"

  unset eza_options
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
