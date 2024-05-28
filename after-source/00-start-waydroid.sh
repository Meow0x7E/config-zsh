#!/usr/bin/zsh

if [[
    "$(get-proc-name $PPID)" == "tmux: server" &&
    "$(tmux display-message -p '#S')" == waydroid &&
    "$(waydroid status | grep -i -E '^Session:\s.+$' | cut -f 2)" == "STOPPED"
]] {
    typeset waydroid_storage="${HOME}/.local/share/waydroid/data/media/0"

    typeset -A location_map=(
        "Documents" "Documents"
        "Downloads" "Download"
        "Music" "Music"
        "Pictures" "Pictures"
        "Videos" "Movies"
    )

    function _clean_mount() {
        for it (${(v)location_map}) {
            typeset target="${waydroid_storage}/${it}"

            # 防止有多个重复挂载项
            while ((1)) {
                if { mount | grep -i "$target" } {
                    sudo umount -v "$target"
                } else {
                    break
                }
            }
        }
    }

    function _bind_mount() {
        for it (${(k)location_map}) {
            typeset _source="${HOME}/${it}"
            typeset _target="${waydroid_storage}/${location_map[${it}]}"

            sudo mount -v -B -m "$_source" "$_target"
        }
    }

    function _notify() {
        notify-send -i '/usr/share/icons/hicolor/512x512/apps/waydroid.png' 'Waydroid' $@
    }

    # 启动会话并获取 pid
    waydroid -v session start &
    typeset pid=$!

    # 等待系统启动完成
    # 如果不在启动完成后执行挂载会导致在安卓系统里面看不见文件，我也不知道为什么
    until (($(waydroid prop get sys.boot_completed))) {
        if [[ "$(waydroid status | grep -i -E '^Session:\s.+$' | cut -f 2)" == "STOPPED" ]] {
            _notify -t 5000 '会话已死亡！'
        }

        sleep 0.2
    }

    sleep 1

    _notify -t 5000 '启动完毕！'
    # 显示主界面
    waydroid show-full-ui

    typeset -x SUDO_ASKPASS="/usr/bin/askpasswd"

    # 挂载前清理旧的绑定，否则重复绑定会导致奇怪的问题
    _clean_mount
    # 绑定目录到安卓内部目录，以便访问
    _bind_mount
    # 等待会话关闭
    wait $pid
    # 清理已绑定的目录
    _clean_mount

    exit 0
}
