#!/usr/bin/zsh

function drop-caches() {
    free -h -t
    sync
    echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null
    free -h -t
}
