#!/usr/bin/zsh

cd "${HOME}"
ln -vs "${0:A:h}/zshrc.zsh" "${HOME}/.zshrc"
exit 0
