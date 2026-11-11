#!/usr/bin/zsh

# 设置 Android SDK
if [[ -d "${HOME}/Android/Sdk" ]] {
	typeset -gx ANDROID_HOME="${HOME}/Android/Sdk"
}
