#!/bin/bash

declare -a apt_apps
declare -a snap_apps
apt_apps+=("snapd", "mpv", "obs-studio", "gimp", "neovim", "vim")
snap_apps+=("code --classic", "scrcpy", "steam", "telegram-desktop")
