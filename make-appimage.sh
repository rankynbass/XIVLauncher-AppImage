#!/bin/bash
SELF=$(readlink -f "$0")
HERE=${SELF%/*}
cd "$HERE"

XLCORE=https://github.com/goatcorp/XIVLauncher.Core/releases/download/1.1.1/XIVLauncher.Core.tar.gz
APPIMGBLDR=https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
ARIA=https://github.com/rankynbass/aria2-static-build/releases/latest/download/aria2-static.tar.gz

# Get XLCore
curl -L "$XLCORE" -o XIVLauncher.Core.tar.gz
curl -L "$ARIA" -o aria2-static.tar.gz
rm -rf AppDir/*
mkdir -p AppDir/opt/xivlauncher-core
tar -xf XIVLauncher.Core.tar.gz -C AppDir/opt/xivlauncher-core
tar -xf aria2-static.tar.gz -C AppDir/opt/xivlauncher-core
mkdir -p AppDir/usr/share/icons/hicolor/256x256/apps
cp xivlauncher.png AppDir/usr/share/icons/hicolor/256x256/apps/xivlauncher.png

# Get appimage-builder
curl -L $APPIMGBLDR -o appimage-builder
chmod +x appimage-builder
./appimage-builder --appimage-extract
./squashfs-root/AppRun --skip-tests

# Package the artifact
mkdir -p xivlauncher
cp XIVLauncher.Core-latest-x86_64.* xivlauncher/
cp install.sh xivlauncher/install.sh
cp uninstall.sh xivlauncher/uninstall.sh
cp xivlauncher.png xivlauncher/xivlauncher.png
cp XIVLauncher-AppImage.desktop xivlauncher/XIVLauncher-AppImage.desktop

tar -czf XIVLauncher-AppImage.tar.gz xivlauncher/*