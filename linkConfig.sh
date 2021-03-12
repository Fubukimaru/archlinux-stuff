
echo "Setting up config on $HOME"

COMPUTER="think"
CFG_PATH="$HOME/workspace/archlinux-stuff"

# Dot files
cd dotfiles
stow -S * -t $HOME
cd ..

# Services
stow -S services -t $HOME

systemctl --user enable mopidy
systemctl --user enable todo_server
systemctl --user enable powertop
systemctl --user enable mbsync.timer
systemctl --user enable vdirsyncer.timer

ln -s ~/.config/X11/Xresources.$COMPUTER ~/.config/X11/Xresources

echo "Remember to configure neomutt accounts!"

ln -s ~/syncthing/share/linux/.task/ ~/
ln -s ~/syncthing/share/linux/.timewarrior/ ~/

# Link screen config
# $LNPRE/scripts/configScreens.sh /usr/local/bin/
sudo cp $CFG_PATH/scripts/configScreens.sh /usr/local/bin 

echo "Warning: linked /usr/local/bin/configScreens.sh but it needs to be configured.\
        In the display manager. E.g. /etc/lightdm/lightdm.conf."

echo "Done"
