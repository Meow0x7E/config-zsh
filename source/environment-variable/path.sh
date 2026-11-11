#!/usr/bin/zsh

# 将通过 Cargo 安装的软件添加进 PATH 中
if [[ -d "${HOME}/.cargo/bin" ]] {
	typeset -gx PATH="${PATH}:${HOME}/.cargo/bin"
}

if [[ -d "${HOME}/.local/bin" ]] {
	typeset -gx PATH="${PATH}:${HOME}/.local/bin"
}
