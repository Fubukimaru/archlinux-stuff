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
PACAUR="pacaur --noconfirm -S" 

## Science - Yaourt
#$PACAUR rstudio-desktop-bin

# Install terminal
$PACAUR st-luke-git


# Instal Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# CFG
mkdir ~/workspace
cd workspace

## Get files
git clone https://github.com/Fubukimaru/archlinux-stuff.git

## Link each in place
cd archlinux-stuff
bash linkConfig.sh


## Install vim plugins
vim -c "PlugInstall"

