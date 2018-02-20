# HOME="/home/$USER"
echo "Setting up config on $HOME"

COMPUTER="think"
PATH="$HOME/workspace/archlinux-stuff/config
LNPre="ln -s -f $PATH"
$LNPre/i3/config ~/.config/i3/config
$LNPre/i3/.i3blocks.conf ~/
$LNPre/vim/.vimrc ~/
$LNPre/vim/.ctags ~/
$LNPre/vim/syntax ~/.vim/
$LNPre/xmodmap/.xmodmap ~/
$LNPre/xresources/.Xresources.$COMPUTER ~/.Xresources
$LNPre/R/.Rprofile ~/
$LNPre/.profile ~/
$LNPre/w3m/keymap ~/.w3m/
$LNPre/roxterm.sourceforge.net ~/.config/

sudo cp $PATH/tlp/tlp /etc/default/tlp

echo "Done"
