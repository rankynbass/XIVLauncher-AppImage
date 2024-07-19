# XIVLauncher.Core in an AppImage package

Just a simple repo set up to make XIVLauncher into an AppImage. This uses appimage-builder, which means that we can specify dependencies in the AppImageBuilder.yml file. I'm using Ubuntu 20.04 at the moment, just for compatibility, but it *does* include libc, so theoretically, we could use any linux distro, including arch.

If you want to build it yourself, set up an ubuntu 20.04 container with [distrobox](https://distrobox.it), clone the repo, and run `./make-appimage.sh`. You'll end up with a folder called xivlauncher that will contain the AppImage and zsync files, as well as an install script that will install it into $HOME/Applications, along with an icon and desktop file so it will appear in your default menu.