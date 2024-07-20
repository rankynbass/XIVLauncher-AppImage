#!/bin/bash
XLCORE=https://github.com/rankynbass/XIVLauncher.Core/releases/latest/download/XIVLauncher.Core.tar.gz
APPIMGBLDR=https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage

# Get XLCore
curl -L "$XLCORE" -o XIVLauncher.Core.tar.gz
rm -rf AppDir/*
mkdir -p AppDir/opt/xivlauncher-core
tar -xf XIVLauncher.Core.tar.gz -C AppDir/opt/xivlauncher-core
mkdir -p AppDir/usr/share/icons/hicolor/256x256/apps
cp xivlauncher.png AppDir/usr/share/icons/hicolor/256x256/apps/xivlauncher.png

# Get appimage-builder
curl -L $APPIMGBLDR -o appimage-builder
chmod +x appimage-builder
./appimage-builder --skip-test

# Package the artifact
mkdir -p xivlauncher
cp XIVLauncher-RB-latest-x86_64.* xivlauncher/
cp install.sh xivlauncher/install.sh
cp uninstall.sh xivlauncher/uninstall.sh
cp xivlauncher.png xivlauncher/xivlauncher.png
cp XIVLauncher-AppImage.desktop xivlauncher/XIVLauncher-AppImage.desktop

tar -czf XIVLauncher-AppImage.tar.gz xivlauncher/*