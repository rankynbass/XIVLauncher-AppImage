#!/bin/bash
./appimage-builder --appimage-extract
DEBIAN_FRONTEND=noninteractive ./squashfs-root/AppRun --skip-tests

# Package the artifact
mkdir -p xivlauncher
cp XIVLauncher.Core-latest-x86_64.* xivlauncher/
cp install.sh xivlauncher/install.sh
cp uninstall.sh xivlauncher/uninstall.sh
cp xivlauncher.png xivlauncher/xivlauncher.png
cp XIVLauncher-AppImage.desktop xivlauncher/XIVLauncher-AppImage.desktop

tar -czf XIVLauncher-AppImage.tar.gz xivlauncher/*