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
apt_apps+=("build-essential" "brightnessctl" "pavucontrol" "xwayland" "sway" "waybar" "python3-i3ipc" "fuzzel" "wofi" "gammastep" "wdisplays" "firefox-esr" "curl" "tree" "fzf" "bat" "htop" "acpi" "nodejs" "npm" "meson" "ninja-build" "cmake" "gettext" "zip" "unzip" "dconf-editor" "snapd" "flatpak" "nautilus" "imv" "mpv" "moc" "moc-ffmpeg-plugin" "audacious" "qbittorrent" "gimp" "tmux" "neovim" "vim" "mdp" "taskwarrior" "gnome-multi-writer" "libgtk-4-media-gstreamer" "fonts-material-design-icons-iconfont" "fonts-font-awesome")
snap_apps+=("core" "snapd" "code --classic", "scrcpy", "steam", "telegram-desktop")
flatpak_apps+=("net.lutris.Lutris")

installerrors=""
outputmessage="APT:-\n"
printf "APT:-"
for app in ${apt_apps[@]};
do
    printf "\nTrying to install $app"
    sudo apt -y install "$app"
    appexistcheck="$((( dpkg -l $app 2>&1 ) | grep -E '^ii' > /dev/null ) && echo installed)"
    if [ "${appexistcheck}" != "installed" ]; then
	    outputmessage="${outputmessage}\e[1;31m$app not installed\n\e[0m"
    else
	    outputmessage="${outputmessage}\e[1;32m$app is installed\n\e[0m"
    fi
    clear
    printf "${outputmessage}"
done

#if [ "${installerrors}" != "" ]; then
#	printf "\nErrors produced by APT:"
#	printf "\n$installerrors\n"
#	outputmessage="${outputmessage}\nErrors produced by APT:\n${installerrors}\n"
#fi

# Installing zed editor
curl -f https://zed.dev/install.sh | sh

exit 1

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
