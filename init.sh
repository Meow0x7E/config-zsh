#!/usr/bin/zsh

find "${ZSH_CONFIG_HOME}/before-source" -type f | sort -n | while {read -r file} {
    source $file
}
