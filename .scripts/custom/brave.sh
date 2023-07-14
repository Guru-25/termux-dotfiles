#!/bin/bash

termux-open https://github.com/brave/brave-browser/releases/download/v$(curl -s https://raw.githubusercontent.com/brave/brave-browser/master/CHANGELOG_ANDROID.md | grep https://github.com/brave/brave-browser/releases/tag/ | head -n 1 | cut -d '[' -f 2 | cut -d ']' -f 1)/BraveMonoarm64.apk