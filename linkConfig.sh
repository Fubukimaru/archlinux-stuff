
echo "Setting up config on $HOME"

COMPUTER="think"

# Remove default configs
rm ~/.bashrc
rm ~/.profile


# Dot files
cd dotfiles
stow -S * -t $HOME
cd ..

# Services
stow -S services -t $HOME

systemctl --user enable mopidy
systemctl --user enable powertop
#systemctl --user enable mbsync.timer
systemctl --user enable vdirsyncer.timer

echo "Configuring Xresources for computer: $COMPUTER"
ln -s ~/.config/X11/Xresources.$COMPUTER ~/.config/X11/Xresources


# Link share binaries
ln -s ~/share/bin ~/bin


echo "Remember to configure neomutt accounts!"
echo "Sync your configs :)"

echo "Done"
