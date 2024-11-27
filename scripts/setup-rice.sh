#!/bin/bash

# Creating the workspace directories
mkdir ~/workspace/
mkdir ~/workspace/main/
mkdir ~/workspace/side/

# Moving the unixporn directory to side projects directory
mv ../../unixporn ~/workspace/side/

# Making the keyboard-backlight script globally accessible
sudo cp ./utilities/keyboard-backlight /bin/

# Adding custom fonts(System-Wide)
sudo cp ../fonts/* /usr/local/share/fonts/

# Adding 3rd parties to APT
sudo mkdir -p /etc/apt/keyrings
### Adding Charm Bracelet
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list

sudo apt update

# Running the script that downloads the apps
sudo ./installapps.sh

# Adding the custom configs
### conky
sudo rm /etc/conky/conky.conf
sudo cp ../configs/conky.conf /etc/conky/
### sway
mkdir -p ~/.config/sway
cp ../configs/sway/config ~/.config/sway/
### waybar
mkdir -p ~/.config/waybar
cp ../configs/waybar/config ~/.config/waybar/
cp ../configs/waybar/style.css ~/.config/waybar/
