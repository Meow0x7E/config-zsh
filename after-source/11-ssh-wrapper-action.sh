#!/usr/bin/zsh

if [[ "$(get_proc_name $PPID)" == "tmux: server" && "$(tmux display-message -p '#S')" =~ ssh-...... ]] {
    print "[33m你已被重定向至 Tmux 会话 ($(tmux display-message -p '#S'))
如果连接断开，你可以在重新连接时使用 Ctrl-b s 来切换会话
切换后如果不需要切换前的会话可以使用 \"tmux kill-session -t <会话名称>\" 来关闭会话。[0m"
}
