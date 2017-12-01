# General packages
sudo pacman -Syu vim tlp i3 dmenu vim doublecmd-gtk2 tpacpi-bat powetrop nmon  

# Manjaro
sudo pacman -S yaourt 


# Yaourt - Yaourt --noconfirm is dangerous. Use at your own risk.
YAOURT="sudo yaourt --noconfirm -S" 
$YAOURT vundle

## Science - Yaourt
$YAOURT mendeleydesktop 
$YAOURT rstudio-desktop 






# CFG
mkdir ~/workspace
cd workspace
## Get files
git clone https://github.com/Fubukimaru/archlinux-stuff.git

## Link each in place
cd archlinux-stuff
bash linkConfig.sh
