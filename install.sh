# Crash if anything fails
set -e
# General packages
sudo pacman-mirrors --geoip && sudo pacman -Syyu

sudo pacman -S gvim tlp i3-wm dmenu doublecmd-gtk2 tpacpi-bat powertop nmon \
    volumeicon arandr ctags syncthing htop autorandr audacious lxappearance \
    texlive-most chromium udiskie lsof xorg-xbacklight xscreensaver tk \
    smartmontools bluez-hid2hci playerctl feh weechat dleyna ethtool neomutt \
    isync vdirsyncer khal firefox rxvt-unicode urxvt-perls i3blocks ncmpcpp \
    task timew stow base-devel xclip odt2txt sxiv bat vlc mpv mpc mpstat \
    newsboat python-keyring ipython python-tasklib zathura-pdf-mupdf \
    zathura-djvu w3m python-future tmux mopidy python-pip dunst bluez-utils \
    ripgrep dictd pandoc trash-cli atool


# Manjaro
sudo pacman -S yay 

PACAUR="yay --noconfirm -S" 
PIP="sudo pip install"

## Science - Yaourt
#$PACAUR rstudio-desktop-bin

# Install AUR stuff
$PACAUR  lf nerd-fonts-liberation-mono redshift-gtk-git \
    syncthing-gtk i3blocks-contrib bugwarrior
# st-luke-git

# Install pip stuff
$PIP mopidy-dleyna mopidy-mpd mopidy-local mopidy-bandcamp


#git-delta-bin
# Req folders
mkdir -p ~/.cache/lf
mkdir -p ~/.mail/
mkdir -p ~/.calendar/

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
bash -c "vim -c 'PlugInstall'"

## Reload Xresources
xrdb ~/.config/X11/Xresources

# Install st
mkdir -p ~/workspace/

cd workspace
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install
cd ../../
