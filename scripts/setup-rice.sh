#!/bin/bash

# Creating the workspace directories
mkdir ~/workspace/
mkdir ~/workspace/main/
mkdir ~/workspace/side/

# Moving the unixporn directory to side projects directory
mv ../../unixporn ~/workspace/side/

# Making the keyboard-backlight script globally accessible
sudo cp ./keyboard-backlight /bin/

# Adding custom fonts(System-Wide)
sudo cp ../fonts/* /usr/local/share/fonts/

# Running the script that downloads the apps
#sudo ./installapps.sh

# Adding the custom config to conky
#cp ../configs/conky.conf ~/.conkyrc
