#!/usr/bin/zsh

if { command -v bat 1>/dev/null; } {
	alias cat='bat --nonprintable-notation unicode'
}
