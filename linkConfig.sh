
echo "Setting up config on $HOME"

COMPUTER="think"
CFG_PATH="$HOME/workspace/archlinux-stuff"
LNPre="ln -s -f $CFG_PATH/config"
$LNPre/i3/ ~/.config/
$LNPre/i3blocks/ ~/.config/
$LNPre/zathura/ ~/.config/
sudo ln -s /usr/lib/i3blocks /usr/share/i3blocks # Compatibility between arch and Ubuntu
$LNPre/vim/.vimrc ~/
$LNPre/vim/.ctags ~/
$LNPre/vim/syntax ~/.vim/
$LNPre/vim/ftplugin ~/.vim/
$LNPre/xmodmap/.xmodmap ~/
$LNPre/xresources/.Xresources.$COMPUTER ~/.Xresources
$LNPre/xresources/.Xresources.d .
$LNPre/R/.Rprofile ~/
$LNPre/.profile ~/
$LNPre/w3m/keymap ~/.w3m/
$LNPre/bash/.bashrc ~/
$LNPre/bash/.extend.bashrc ~/
$LNPre/bash/.inputrc ~/

$LNPre/ranger/ ~/.config/
$LNPre/neomutt ~/.config/neomutt
echo "Remember to configure neomutt accounts!"


ln -s ~/syncthing/share/linux/.task/ ~/
ln -s ~/syncthing/share/linux/.timewarrior/ ~/

sudo cp $CFG_PATH/config/tlp/tlp /etc/default/tlp

# Link screen config
# $LNPRE/scripts/configScreens.sh /usr/local/bin/
sudo cp $CFG_PATH/scripts/configScreens.sh /usr/local/bin 

echo "Warning: linked /usr/local/bin/configScreens.sh but it needs to be configured.\
        In the display manager. E.g. /etc/lightdm/lightdm.conf."


echo "Done"
