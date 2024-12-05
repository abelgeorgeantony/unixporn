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
declare -a apt_deps
declare -a snap_apps
declare -a flatpak_apps
apt_apps+=("brightnessctl" "pavucontrol" "sway" "waybar" "fuzzel" "wofi" "gammastep" "wdisplays" "firefox-esr" "curl" "tree" "fzf" "bat" "htop" "sl" "cmatrix" "acpi" "nodejs" "npm" "meson" "ninja-build" "cmake" "gettext" "zip" "unzip" "dconf-editor" "snapd" "flatpak" "nautilus" "imv" "mpv" "moc" "audacious" "qbittorrent" "gimp" "tmux" "neovim" "vim" "mdp" "taskwarrior" "gnome-multi-writer")
apt_deps+=("build-essential" "xwayland" "wayland-protocols" "pkg-config" "libwayland-dev" "libegl-dev" "libmpv-dev" "python3-i3ipc" "libgtk-4-media-gstreamer" "fonts-material-design-icons-iconfont" "fonts-font-awesome")
snap_apps+=("core" "snapd" "code --classic", "scrcpy", "steam", "telegram-desktop")
flatpak_apps+=("net.lutris.Lutris" "com.bitwig.BitwigStudio")

installerrors=""
outputmessage="APT apps:-\n"
printf $outputmessage
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

clear
outputmessage="${outputmessage}\nAPT dependencies:-\n"
printf $outputmessage
for dep in ${apt_deps[@]};
do
    printf "\nTrying to install $dep"
    sudo apt -y install "$dep"
    appexistcheck="$((( dpkg -l $dep 2>&1 ) | grep -E '^ii' > /dev/null ) && echo installed)"
    if [ "${appexistcheck}" != "installed" ]; then
	    outputmessage="${outputmessage}\e[1;31m$dep not installed\n\e[0m"
    else
	    outputmessage="${outputmessage}\e[1;32m$dep is installed\n\e[0m"
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
