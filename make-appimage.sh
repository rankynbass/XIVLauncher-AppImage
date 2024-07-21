#!/bin/bash
./appimage-builder --skip-test

# Package the artifact
mkdir -p xivlauncher
cp XIVLauncher-RB-latest-x86_64.* xivlauncher/
cp install.sh xivlauncher/install.sh
cp uninstall.sh xivlauncher/uninstall.sh
cp xivlauncher.png xivlauncher/xivlauncher.png
cp XIVLauncher-AppImage.desktop xivlauncher/XIVLauncher-AppImage.desktop

tar -czf XIVLauncher-AppImage.tar.gz xivlauncher/*