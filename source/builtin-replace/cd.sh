#!/usr/bin/bash

if command -v zoxide 1>/dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi
