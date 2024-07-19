#!/bin/bash
if [[ -z "$XDG_DATA_HOME" ]]; then
    XDG_DATA_HOME="$HOME"/.local/share
fi
SELF=$(readlink -f "$0")
HERE=${SELF%/*}
mkdir -p "$HOME"/Applications
mkdir -p "$XDG_DATA_HOME"/icons/xivlauncher-core
cp "$HERE"/XIVLauncher.Core-latest-x86_64.* "$HOME"/Applications/
cp "$HERE"/xivlauncher.png "$XDG_DATA_HOME"/icons/xivlauncher-core/xivlauncher.png
sed -i "s|Exec=|Exec=$HOME/Applications/XIVLauncher.Core-latest-x86_64.AppImage|" "$HERE"/XIVLauncher.desktop
sed -i "s|Icon=|Icon=$XDG_DATA_HOME/icons/xivlauncher-core/xivlauncher.png|" "$HERE"/XIVLauncher.desktop
cp "$HERE"/XIVLauncher.desktop "$XDG_DATA_HOME"/applications/XIVLauncher-AppImage.desktop
xdg-desktop-menu forceupdate