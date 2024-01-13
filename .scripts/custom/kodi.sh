#!/bin/bash

termux-open https://mirrors.kodi.tv/releases/android/arm64-v8a/$"(curl -s https://github.com/xbmc/xbmc | grep "css-truncate css-truncate-target text-bold mr-2" | cut -d '"' -f 5 | cut -d '<' -f 1 | sed 's/>/kodi-/g')"-arm64-v8a.apk
