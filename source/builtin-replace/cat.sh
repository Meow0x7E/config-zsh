#!/usr/bin/bash

if command -v bat 1>/dev/null; then
  alias cat='bat --nonprintable-notation unicode'
fi
