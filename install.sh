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
    ripgrep dictd pandoc trash-cli atool aspell ruby ttf-liberation-mono-nerd \
    urlscan bash-completion redshift git-delta

# Manjaro
sudo pacman -S yay 

PACAUR="yay --noconfirm -S" 

# Install AUR stuff
$PACAUR  lf syncthing-gtk i3blocks-contrib bugwarrior mopidy-dleyna mopidy-mpd \
    mopidy-local mopidy-bandcamp

# Install st
mkdir -p ~/workspace
cd workspace
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install
cd ../../

# Req folders
mkdir -p ~/.cache/lf
mkdir -p ~/.mail/
mkdir -p ~/.calendar/

## Link each in place
bash linkConfig.sh

## Reload Xresources
xrdb ~/.config/X11/Xresources

# Vim
## Install Plug
mkdir -p ~/.config/vim/autoload
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Install vim plugins (execute bash to reload bashrc)
bash -c "vim -c 'PlugInstall'"
