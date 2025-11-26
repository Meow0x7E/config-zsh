#!/usr/bin/zsh

# 设置 Android SDK
if [[ -d "${HOME}/Android/Sdk" ]] {
  typeset -x ANDROID_HOME="${HOME}/Android/Sdk"
}
