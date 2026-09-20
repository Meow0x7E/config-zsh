#!/usr/bin/bash

# 设置 Android SDK
if [[ -d "${HOME}/Android/Sdk" ]]; then
  typeset -x ANDROID_HOME="${HOME}/Android/Sdk"
fi
