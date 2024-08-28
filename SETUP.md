# From Debian 12 fresh installation to rice!

### Adding a user to the sudoers list!
The user account will not be automatically added to the sudoers list. So to add yourself to the sudo list, first go into **su** by executing:
```
su
```
Then it will ask for the **su** password(The password of your user account will not work, should give the root password).\
After becoming **su**, execute:
```
sudo visudo
```
This will open up a file to edit. Add:
```
yourusername    ALL=(ALL:ALL) ALL
```
Under
```
root    ALL=(ALL:ALL) ALL
```

After saving the file the user mentioned will be added to the sudoers list.

### Trying to turn on "Night Light"/"Blue light filter"
The Night Light feature may seem to not work when applied on a fresh install! This is because the night light is automatically set to work only from sunset to sunrise. To make it work manually by clicking the night light button:\
	Open the settings app and Find the settings of night light. There, change the schedule to manual mode. Then set the time from 00:00 to 00:00.

### Installing the apps related to my rice
There is a script named "installapps.sh"(The script is not yet completed!) at **./scripts**. It will download the apps automatically. The script should be executed as sudo. The list of apps can be found out by reading the script. The apps will be declared in their respective arrays. Install the apps either using the script or manually.

### Changing the size of every text/font
I usually keep my laptop at a small distance from me because I have an external keyboard and laptop stand, so it is pretty stressing to look at the UI and its texts, as they are too small. An easy and fast trick is to go to accessibility settings and turn on **Large Text** option. Although this might not make it very precisely comfortable, it will atleast ease some stress when setting up the rice.\
To change the text size according to your liking open the **Gnome Tweaks** app. If you are on a system like ubuntu, Tweaks might not be installed. So install it first. In the Tweaks app there is a section named **Fonts** in the sidebar. You can customise mostly everything about your font in here.\
My settings for font:\
I usually use the large text option with the custom values in the Tweaks app.\
Interface Text: 16\
Monospace Text: 16\
Scaling Factor: 1.30\
I also change the default zoom of pages in firefox to **133%**. Firefox->Settings->Zoom->Default Zoom.

### GNOME shell extensions of the rice
There are some GNOME shell extensions required for the rice:\
Dash to Dock, Blur my Shell, Hanabi\
These(except the Hanabi extension) can be found at the [GNOME Extensions](https://extensions.gnome.org/) site. You need to search up the above mentioned extensions and install them on to your system. To install them from the site, you have to install and enable the browser extension that gnome provides. The instructions to do so will be displayed in the site itself.\
For the Hanabi Extension you have to compile it from [source](https://github.com/jeffshee/gnome-ext-hanabi), its not yet available in the GNOME website. Follow the instructions in the github page to install it.

### Adding the minimize and maximise buttons to window titlebars
To add minimize and maximise buttons to a window, open the **GNOME Tweaks** app and find the option **Window Titlebars** in the sidebar. There you can add the minimize and maximise buttons for most windows.

### Installing custom fonts
My native language is Malayalam. So when browsing the web that displays Malayalam, the characters are replaced by placeholder characters. This is because Malayalam fonts are not included with debian. To install a font:\
First get a font from somewhere(Usually files that end with .ttf, some fonts can be found at **./fonts**). Then put the file in **/usr/local/share/fonts** (to access system-wide), **~/.local/share/fonts** (to access user-specific).

