#!/bin/bash

termux-open https://divestos.org/fdroid/official/us.spotco.fennec_dos_$(curl -s https://gitlab.com/divested-mobile/mull-fenix/-/raw/master/-fdroiddata/metadata/us.spotco.fennec_dos.yml | grep CurrentVersionCode | cut -d ' ' -f 2).apk