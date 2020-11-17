#export TERMINAL=roxterm
#export TERMINAL=terminator
#export TERMINAL=sakura
export TERMINAL=urxvt
#export TERMINAL="gnome-terminal"
export EDITOR=vim
export BROWSER=firefox

# Detachable cmus
# alias cmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus)"'
# alias cmus='screen -q -r -D cmus || screen -S cmus $(which cmus)'

# local bin 
export PATH="$HOME/bin:$PATH"
# Path MSX
export PATH="$PATH:$HOME/MSX/bin"

# todoman alias
alias todoman='todo'


# El tiempo
alias wsan='curl wttr.in/"San Vicente de la Barquera"'
alias wcor='curl wttr.in/"Coruña"'
alias wbar='curl wttr.in/Barcelona'
alias wbar2='curl v2.wttr.in/Barcelona'
alias wbar_json='curl wttr.in/Barcelona?format=j1'

# Coronavirus
alias coronatrack='curl https://corona-stats.online?top=10'

# Python envs
alias keras='source ~/.virtualEnvs/keras/bin/activate'

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

## Jupyter
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter 

## XinitRC

export XINIT_DIR="$XDG_CONFIG_HOME"/X11
export XINITRC="$XINIT_DIR"/xinitrc
export XSERVERRC="$XINIT_DIR"/xserverrc

## Notmuchtask

export NOTMUCHTASKRC="$XDG_CONFIG_HOME"/notmuchtask/notmuchtask.conf

## VIM
export VIMCONFIG="$XDG_CONFIG_HOME"/vim/
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'



