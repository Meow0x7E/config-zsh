if command -v scrcpy 1>/dev/null; then
  function scrcpy-control() {
    local -a scrcpy_options=(
      --keyboard=uhid
      --mouse=uhid
      --max-fps=60

      --video-buffer=10
      --video-bit-rate=16M
      --video-codec=h264 --video-encoder=OMX.qcom.video.encoder.avc
      #--video-codec=h265 --video-encoder=OMX.qcom.video.encoder.hevc

      --no-audio-playback
      #--audio-source=output
      #--audio-codec=raw
      #--audio-codec=flac --audio-encoder=OMX.google.flac.encoder
    )

    command scrcpy "${scrcpy_options[@]}"
  }
fi
