# General packages
sudo pacman -Syu vim tlp i3 dmenu doublecmd-gtk2 tpacpi-bat powetrop nmon \
					volumeicon arandr ctags powerline-fonts moc clementine \
					audacious lxappearance texlive-most chromium udiskie\
					lsof xorg-xbacklight xscreensaver tk smartmontools\
					bluez-firmware bluez-hid2hci playerctl feh weechat\
                    ethtools neomutt isync vdirsyncer khal firefox \
                    urxvt i3blocks ncmpcpp taskwarrior timewarrior \
                    syncthing htop autorandr

# Manjaro
sudo pacman -S pacaur 


# Yaourt - Yaourt --noconfirm is dangerous. Use at your own risk.
YAOURT="pacaur --noconfirm -S" 

## Science - Yaourt
$YAOURT mendeleydesktop rstudio-desktop-bin dropbox spotify 


# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim



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
