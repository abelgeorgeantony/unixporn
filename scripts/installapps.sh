#!/bin/bash

clr () {
        local j;
        for ((j = 0; j <= "${1:-1}"; j++ ));
        do
                tput cuu1;
        done;
        tput ed;
}


declare -a apt_apps
declare -a snap_apps
declare -a flatpak_apps
apt_apps+=("testmfmfmfjfsfdasfdabelgeorgeantony" "build-essential" "nodejs" "npm" "meson" "ninja-build" "gettext" "zip" "unzip" "dconf-editor" "snapd" "flatpak" "mpv" "gimp" "tmux" "neovim" "vim" "conky-all" "taskwarrior" "gnome-multi-writer")
snap_apps+=("code --classic", "scrcpy", "steam", "telegram-desktop")
flatpak_apps+=("net.lutris.Lutris")

installerrors="Nothing here"
for app in ${apt_apps[@]}; 
do
    echo "Trying to install $app"
    error="$(sudo apt-get -qq --yes install $app 2>&1)"
    if [ "${error}" != "" ]; then
	    installerrors="$installerrors$error"
    fi
done

echo $installerrors

#Apps to download from other source:
##	obs studio
##	virtualbox
##	zed
##	chrome
##	Genshin Impact
##	TLauncher Minecraft
