#!/bin/bash

# Fetch the GitHub page HTML and extract the APK filename
apk_filename=$(curl -s https://github.com/xbmc/xbmc | grep "css-truncate css-truncate-target text-bold mr-2" | cut -d '"' -f 5 | cut -d '<' -f 1 | sed 's/>v/kodi-/g')-arm64-v8a.apk

# Construct the download URL
download_url="https://mirrors.kodi.tv/releases/android/arm64-v8a/$apk_filename"

# Use termux-open to download and open the APK
termux-open $download_url

