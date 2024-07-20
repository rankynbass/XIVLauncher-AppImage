#!/bin/bash
if [[ -z "$XDG_DATA_HOME" ]]; then
    XDG_DATA_HOME="$HOME"/.local/share
fi
SELF=$(readlink -f "$0")
HERE=${SELF%/*}
rm -f "$HOME"/Applications/XIVLauncher-RB-latest-x86_64.AppImage "$HOME"/Applications/XIVLauncher-RB-latest-x86_64.AppImage.zsync
rm -f "$XDG_DATA_HOME"/icons/xivlauncher-rb/xivlauncher.png
rmdir "$XDG_DATA_HOME"/icons/xivlauncher-rb
rm -f "$XDG_DATA_HOME"/applications/XIVLauncher-RB-AppImage.desktop
xdg-desktop-menu forceupdate