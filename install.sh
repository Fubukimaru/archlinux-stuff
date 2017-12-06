# General packages
sudo pacman -Syu vim tlp i3 dmenu vim doublecmd-gtk2 tpacpi-bat powetrop nmon \
					volumeicon arandr ctags powerline-fonts moc clementine \
					audacious purple-facebook lxappearance texlive-most \
					texmaker chromium lsof xorg-xbacklight xscreensaver tk \
					bluez-firmware bluez-hid2hci

# Manjaro
sudo pacman -S yaourt 


# Yaourt - Yaourt --noconfirm is dangerous. Use at your own risk.
YAOURT="yaourt --noconfirm -S" 
$YAOURT vundle

## Science - Yaourt
$YAOURT mendeleydesktop rstudio-desktop-bin dropbox spotify 






# CFG
mkdir ~/workspace
cd workspace
## Get files
git clone https://github.com/Fubukimaru/archlinux-stuff.git

## Link each in place
cd archlinux-stuff
bash linkConfig.sh


## Install vim plugins
vim -c "PluginInstall"


# /etc/bluetooth/main.conf -> put AutoEnable=True
