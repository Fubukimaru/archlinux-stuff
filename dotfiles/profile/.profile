## Add profile.d sh

#export TERMINAL="gnome-terminal"
#export TERMINAL=roxterm
#export TERMINAL=terminator
#export TERMINAL=sakura
#export TERMINAL=urxvt
export TERMINAL=st
#export TERMINAL=xfce4-terminal


export EDITOR=vim
export BROWSER=firefox

# Detachable cmus
# alias cmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus)"'
# alias cmus='screen -q -r -D cmus || screen -S cmus $(which cmus)'

# local bin 
export PATH="$HOME/bin:$PATH"

# rm
alias rm="rm -i"

# todoman alias
alias todoman='todo'

# El tiempo
alias wsan='curl wttr.in/San%20Vicente%20de%20la%20Barquera'
alias wsan2='curl v2.wttr.in/San%20Vicente%20de%20la%20Barquera'
alias wcor='curl wttr.in/"Coruña"'
alias wbar='curl wttr.in/Barcelona'
alias wbar2='curl v2.wttr.in/Barcelona'
alias wbar_json='curl wttr.in/Barcelona?format=j1'

alias dict='cdict'

# Nvidia CUDA
export PATH=/usr/local/cuda/bin:$PATH:/usr/local/osx-ndk-x86/bin
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH


# Acroread
# https://hub.docker.com/r/chrisdaish/acroread/
alias acroreadCreate="docker run  -v $HOME/Documents:/home/acroread/Documents:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e uid=$(id -u) \
            -e gid=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
             --name acroread \
            chrisdaish/acroread"

#alias acroread="docker start acroread"


# Home cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

## Readline
export INPUTRC="$HOME/.config/readline/inputrc"

## PSQL
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

export PSQL_PAGER="pspg"

## Mopidy

export XDG_MUSIC_DIR="$HOME/Music/"


## Taskwarrior

export TASKDATA="$XDG_DATA_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/taskrc

## Timewarrior

### To be done: https://github.com/GothenburgBitFactory/timewarrior/issues/207


## Weechat
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat


## Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JAVA_HOME="/usr/lib/jvm/default"

## Jupyter
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter 

## XinitRC

export XINIT_DIR="$XDG_CONFIG_HOME"/X11
export XINITRC="$XINIT_DIR"/xinitrc
export XSERVERRC="$XINIT_DIR"/xserverrc

## Notmuch

export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug

## Notmuchtask

export NOTMUCHTASKRC="$XDG_CONFIG_HOME"/notmuchtask/notmuchtask.conf

## VIM
export VIMCONFIG="$XDG_CONFIG_HOME"/vim/
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'


# Spark

#export SPARK_HOME="/usr/local/lib/python3.8/dist-packages/pyspark"
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
#export PATH=$PATH:$SPARK_HOME/bin

# mbsync XDG

alias mbsync='mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc'


#### LF Icons
# LF icons
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"



