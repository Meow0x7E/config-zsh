#!/usr/bin/zsh

function gif-gen() {
    typeset file="$1"
    shift
    ffmpeg -loglevel verbose -r 15 -i "$file" -filter_complex 'zscale=w=1024:h=-2:f=5:t=13,split[s1][s2],[s1]palettegen=stats_mode=2[p],[s2][p]paletteuse=dither=3:diff_mode=1' $@ "${file:r}.gif"
}
