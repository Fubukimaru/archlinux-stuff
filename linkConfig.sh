
echo "Setting up config on $HOME"

COMPUTER="think"
CFG_PATH="$HOME/workspace/archlinux-stuff"

cd dotfiles
stow -S * -t $HOME
cd ..

echo "Remember to configure neomutt accounts!"

ln -s ~/syncthing/share/linux/.task/ ~/
ln -s ~/syncthing/share/linux/.timewarrior/ ~/

# Link screen config
# $LNPRE/scripts/configScreens.sh /usr/local/bin/
sudo cp $CFG_PATH/scripts/configScreens.sh /usr/local/bin 

echo "Warning: linked /usr/local/bin/configScreens.sh but it needs to be configured.\
        In the display manager. E.g. /etc/lightdm/lightdm.conf."

echo "Done"
