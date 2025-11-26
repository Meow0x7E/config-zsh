#!/usr/bin/zsh

# 将 HDR 视频实时转换为 SDR 格式并进行播放
#
# 该函数使用 ffplay 和 libplacebo 滤镜实现 HDR 到 SDR 的色调映射，
# 并强制转换为 bt709 色彩标准，支持 Vulkan 硬件加速
#
# 参数:
#   $1: 必需，输入视频文件路径
#   $@: 可选，传递给 ffplay 的附加参数
#
# 返回值:
#   0: 成功执行
#   1: 缺少必要依赖(ffplay)
#
# 示例:
#   hdr-to-sdr-video-play ./input.h265.mkv
#   hdr-to-sdr-video-play ./input.mkv -fs  # 全屏播放
function hdr-to-sdr-video-play() {
  # 检查 ffplay 是否可用
  _which ffplay || return 1

  local file="$1"  # 存储要播放的视频文件路径
  shift            # 从参数列表中移除第一个参数(文件路径)

  # 构建 ffplay 选项数组，提高代码可读性和可维护性
  local -a FFPLAY_OPTIONS=(
    -loglevel info           # 设置日志级别为 info
    -i "$file"               # 指定输入文件
    # 应用 libplacebo 滤镜进行 HDR 到 SDR 的转换:
    #   tonemapping=auto: 自动选择最适合的色调映射算法
    #   colorspace=bt709: 设置输出色彩空间为 bt709
    #   color_primaries=bt709: 设置输出原色为 bt709
    #   color_trc=bt709: 设置输出传输特性为 bt709
    -vf 'libplacebo=tonemapping=auto:colorspace=bt709:color_primaries=bt709:color_trc=bt709'
    -enable_vulkan          # 启用 Vulkan 硬件加速
    "$@"                    # 传递剩余参数给 ffplay
  )

  # 使用构建的选项数组执行 ffplay
  ffplay "${FFPLAY_OPTIONS[@]}"
}
