#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q openrct2 | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://github.com/OpenRCT2/OpenRCT2/raw/refs/heads/develop/resources/logo/icon_flag.svg
export DESKTOP=/usr/share/applications/io.openrct2.openrct2.desktop
export STARTUPWMCLASS=openrct2
export USE_HOST_DRIVERS_EXPERIMENTAL=1

# Deploy dependencies
quick-sharun /usr/bin/openrct2

# Turn AppDir into AppImage
quick-sharun --make-appimage
