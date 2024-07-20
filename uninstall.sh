#!/bin/bash
if [[ -z "$XDG_DATA_HOME" ]]; then
    XDG_DATA_HOME="$HOME"/.local/share
fi
SELF=$(readlink -f "$0")
HERE=${SELF%/*}
rm -f "$HOME"/Applications/XIVLauncher.Core-latest-x86_64.AppImage "$HOME"/Applications/XIVLauncher.Core-latest-x86_64.AppImage.zsync
rm -f "$XDG_DATA_HOME"/icons/xivlauncher-core/xivlauncher.png
rmdir "$XDG_DATA_HOME"/icons/xivlauncher-core
rm -f "$XDG_DATA_HOME"/applications/XIVLauncher-AppImage.desktop
xdg-desktop-menu forceupdate