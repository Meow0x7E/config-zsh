#!/usr/bin/zsh

function get-proc-name() {
    head -n 1 /proc/$1/status | sed -e 's/Name:\t//'
}
