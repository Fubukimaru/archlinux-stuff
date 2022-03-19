# Crash if anything fails
set -e
# General packages
sudo pacman-mirrors --geoip && sudo pacman -Syyu

sudo pacman -S vim tlp i3 dmenu doublecmd-gtk2 tpacpi-bat powertop nmon \
	volumeicon arandr ctags syncthing htop autorandr \
	audacious lxappearance texlive-most chromium udiskie\
	lsof xorg-xbacklight xscreensaver tk smartmontools\
	bluez-hid2hci playerctl feh weechat\
    ethtool neomutt isync vdirsyncer khal firefox \
    rxvt-unicode urxvt-perls i3blocks ncmpcpp task timew \
    stow base-devel xclip odt2txt sxiv bat

# Manjaro
sudo pacman -S pacaur 

# Yaourt - Yaourt --noconfirm is dangerous. Use at your own risk.
PACAUR="pacaur --noconfirm -S" 

## Science - Yaourt
#$PACAUR rstudio-desktop-bin

# Install terminal
$PACAUR st-luke-git git-delta-bin lf

# Instal Plug
mkdir -p ~/.config/vim/autoload
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# CFG
# mkdir ~/workspace
# cd ~/workspace
# 
# ## Get files
# git clone https://github.com/Fubukimaru/archlinux-stuff.git

## Link each in place
#cd archlinux-stuff
bash linkConfig.sh

## Install vim plugins (execute bash to reload bashrc)
bash vim -c "PlugInstall"

## Reload Xresources
xrdb ~/.config/X11/Xresources
