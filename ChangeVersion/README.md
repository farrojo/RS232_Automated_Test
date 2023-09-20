# Change Version

This example is a simple sample, where the docklight script executes the following steps:

* Open the .ptp file that contains a list of AT commands that configure the device.
* The script calls the command according to the name given, e.g. "Stop" and sends the sequence
  
once the routine is finished, close the execution

The modem constantly runs its firmware, so the following sequence must be followed, in order to change the version or reinstall it:

* Firmware execution must be stopped
* the current version must be uninstalled
* The new version must be loaded, if bulk loading is handled, and it handles the same folder name, the new version will overwrite the previous version
* Once installed, you must start executing the version

And with these steps the version change is completed.

**Note**: Docklight allows to send the commands directly from script, but this example was done re-using the .ptp file in a previous solution.

## Install Docklight in Ubuntu

### Taken from [Here](https://docklightnews.blogspot.com/2021/03/docklight-on-linux.html)

Run these all commands, explanation on link:
```
sudo apt install winetricks
sudo winetricks ---self-update
winetricks arch=32 prefix=docklight32
export WINEPREFIX=~/.local/share/wineprefixes/docklight32
winetricks corefonts consolas
winetricks vb6run richtx32 comdlg32ocx comctl32ocx wsh57
```
After previous installation and setup finish, installs docklight like this:
```
export WINEPREFIX=~/.local/share/wineprefixes/docklight32
wine /home/$user/Downloads/setup.exe
```
