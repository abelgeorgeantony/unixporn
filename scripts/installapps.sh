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
apt_apps+=("testmfmfmfjfsfdasfdabelgeorgeantony" "brightnessctl" "build-essential" "nodejs" "npm" "meson" "ninja-build" "gettext" "zip" "unzip" "dconf-editor" "snapd" "flatpak" "mpv" "gimp" "tmux" "neovim" "vim" "conky-all" "taskwarrior" "gnome-multi-writer")
snap_apps+=("core" "snapd" "code --classic", "scrcpy", "steam", "telegram-desktop")
flatpak_apps+=("net.lutris.Lutris")

installerrors=""
outputmessage="APT:-\n"
printf "APT:-"
for app in ${apt_apps[@]};
do
    printf "\nTrying to install $app"
    error="$(sudo apt-get -qq --yes install $app 2>&1)"
    if [ "${error}" != "" ]; then
	    installerrors="$installerrors\e[1;31m$error\n\e[0m"
	    outputmessage="${outputmessage}\e[1;31m$app not installed\n\e[0m"
    else
	    outputmessage="${outputmessage}\e[1;32m$app is installed\n\e[0m"
    fi
    clear
    printf "${outputmessage}"
done
if [ "${installerrors}" != "" ]; then
	printf "\nErrors produced by APT:"
	printf "\n$installerrors\n"
	outputmessage="${outputmessage}\nErrors produced by APT:\n${installerrors}\n"
fi

printf "\nSnap:-"
outputmessage="${outputmessage}\nSnap:-"
for app in ${snap_apps[@]};
do
	printf "\nTrying to install $app\n"
	msg=$(sudo snap install $app)
	outputmessage="${outputmessage}\n${msg}\n"
done

#Apps to download from other source:
##	obs studio
##	virtualbox
##	zed
##	chrome
##	Genshin Impact
##	TLauncher Minecraft
