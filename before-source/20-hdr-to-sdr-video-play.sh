#!/usr/bin/zsh

function hdr-to-sdr-video-play() {
    typeset file=$1
    shift
    ffplay -loglevel info -i $file -vf 'libplacebo=tonemapping=auto:colorspace=bt709:color_primaries=bt709:color_trc=bt709' -enable_vulkan $@
}
