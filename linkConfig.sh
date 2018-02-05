# HOME="/home/$USER"
echo "Setting up config on $HOME"

COMPUTER="think"

LNPre="ln -s -f $HOME/workspace/archlinux-stuff/config"
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

sudo $LNPre/tlp/tlp /etc/default/tlp

echo "Done"
