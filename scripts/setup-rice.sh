#!/bin/bash

if [ "$EUID" -eq 0 ]
then
	echo -e "Do not run the script as root!\nSetup aborted!"
	exit
fi

# Creating the workspace directories
mkdir -pv ~/workspace/main/
mkdir ~/workspace/side/

# Moving the unixporn directory to side projects directory
mv ../../unixporn ~/workspace/side/

# Adding custom fonts(System-Wide)
sudo mkdir -pv /usr/local/share/fonts/
sudo cp ../fonts/* /usr/local/share/fonts/

# Making the keyboard-backlight script globally accessible
sudo cp ./utilities/keyboard-backlight /bin/

# Adding 3rd parties to APT
sudo mkdir -pv /etc/apt/keyrings
### Adding Charm Bracelet
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list

sudo apt update

# Running the script that downloads the apps
sudo ./installapps.sh

# Adding the custom configs
./configman --add-all
