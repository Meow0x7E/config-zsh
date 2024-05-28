#!/usr/bin/zsh

if [[ "$(get-proc-name $PPID)" == "tmux: server" && "$(tmux display-message -p '#S')" =~ ssh-...... ]] {
    typeset SESSION="$(tmux display-message -p '#S')"
    typeset LIST=(${(f)"$(tmux ls -F '#S' | grep -e '^ssh-......' | grep -v -e "^$SESSION\$")"})
    if ((#LIST > 0)) {
        echo "发现已存在的 tmux 会话，请问你希望重新连接还是创建一个新的?"
        select it (yes no) {
            if [[ "$it" == "no" ]] {
                break
            }
            tmux choose-tree -Zs
            while ((1)) {
                if [[ -z "$(tmux list-clients -F '#S' | grep -e "^$SESSION\$")" ]] {
                    exit
                }
                sleep 1
            }
        }
    }
}
