#!/usr/bin/zsh

if { command -v zoxide 1>/dev/null; } {
	eval "$(zoxide init --cmd cd zsh)"
}
