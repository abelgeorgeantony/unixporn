#!/bin/bash

declare -a apt_apps
declare -a snap_apps
declare -a flatpak_apps
apt_apps+=("snapd", "flatpak", "mpv", "gimp", "neovim", "vim", "conky")
snap_apps+=("code --classic", "scrcpy", "steam", "telegram-desktop")
flatpak_apps+=("net.lutris.Lutris")
#Apps to download from source:
##	obs studio
##	zed
##	chrome
