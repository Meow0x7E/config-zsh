#!/usr/bin/bash

# 将通过 Cargo 安装的软件添加进 PATH 中
if [[ -d "${HOME}/.cargo/bin" ]]; then
  typeset -x PATH="${PATH}:${HOME}/.cargo/bin"
fi

if [[ -d "${HOME}/.local/bin" ]]; then
  typeset -x PATH="${PATH}:${HOME}/.local/bin"
fi

if [[ -d "${ZSH_CONFIG_HOME}/bin" ]]; then
  typeset -x PATH="${PATH}:${ZSH_CONFIG_HOME}/bin"
fi
