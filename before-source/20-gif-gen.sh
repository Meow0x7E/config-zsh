#!/usr/bin/zsh

# 将视频文件转换为高质量 GIF 动画
#
# 该函数使用 ffmpeg 和高级滤镜链将视频文件转换为优化的 GIF 动画
# 使用 zscale 滤镜进行高质量缩放，palettegen 和 paletteuse 进行颜色优化
#
# 参数:
#   $1: 必需，输入视频文件路径
#
# 输出:
#   生成与输入文件同名的 GIF 文件(扩展名改为 .gif)
#
# 依赖:
#   - ffmpeg: 视频处理工具
#
# 示例:
#   gif-gen input.mp4          # 将 input.mp4 转换为 input.gif
#   gif-gen video.mov -t 10    # 转换前10秒的视频
function gif-gen() {
  _which ffmpeg

  local input="$1"                # 存储输入文件路径
  local output="${1:r}.gif"      # 生成输出文件名(替换扩展名为.gif)

  # 构建 ffmpeg 选项数组，使用复杂滤镜链进行高质量 GIF 转换
  local ffmpeg_options=(
    -loglevel info            # 设置日志级别
    -i "$input"                  # 指定输入文件
    # 复杂滤镜链:
    #   1. zscale=w=1024:h=-2:f=5:t=13: 高质量缩放至宽度1280像素，保持宽高比
    #      (使用lanczos过滤算法和三角形dithering)
    #   2. split[s1][s2]: 将视频流分割为两个相同的流
    #   3. [s1]palettegen=stats_mode=2[p]: 从一个流生成优化的调色板
    #   4. [s2][p]paletteuse=dither=3:diff_mode=1: 使用生成的调色板处理另一个流
    #      (使用floyd_steinberg抖动和差异模式)
    -filter_complex 'zscale=w=1280:h=-2:f=5:t=13,split[s1][s2],[s1]palettegen=stats_mode=2[p],[s2][p]paletteuse=dither=3:diff_mode=1'
    -r 10                        # 设置输出帧率为24fps
    "$output"                    # 指定输出文件
  )

  # 执行 ffmpeg 命令进行转换
  ffmpeg "${ffmpeg_options[@]}"
}

# vim:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
