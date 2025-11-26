#!/usr/bin/zsh

# 事实上我很少会误输入这个，我会在按回车前发现自己的 ls 反了，而且我更习惯使用 all
if { 1>/dev/null which sl } {
  alias 'sl'='sl -ce3'
}
