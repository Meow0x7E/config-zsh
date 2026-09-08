#!/usr/bin/zsh

if { 1>/dev/null which trash-put } {
  alias rm="trash-put "
}
