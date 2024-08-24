#!/bin/bash

declare -a apt_apps
declare -a snap_apps
declare -a flatpak_apps
apt_apps+=("zip", "unzip", "dconf-editor", "snapd", "flatpak", "mpv", "gimp", "tmux", "neovim", "vim", "conky", "gnome-multi-writer")
snap_apps+=("code --classic", "scrcpy", "steam", "telegram-desktop")
flatpak_apps+=("net.lutris.Lutris")
#Apps to download from other source:
##	obs studio
##	virtualbox
##	zed
##	chrome
##	Genshin Impact
##	TLauncher Minecraft
