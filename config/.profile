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
alias wbar='curl wttr.in/Barcelona'

# Python envs
alias keras='source ~/.virtualEnvs/keras/bin/activate'


# Nvidia CUDA
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH


# BSCDC
alias b5='ssh -X b5'

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

