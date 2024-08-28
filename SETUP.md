# From Debian 12 fresh installation to rice!

### Adding a user to the sudoers list!
The user account will not be automatically added to the sudoers list. So to add yourself to the sudo list, first go into **su** by executing:
```
su
```
Then it will ask for the **su** password(The password of your user account will not work, should give the root password)./
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
