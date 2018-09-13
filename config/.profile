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

# local bin + Path MSX
export PATH="$HOME/bin:$PATH:$HOME/MSX/bin"

# vim + todoman alias
alias vim='vim --servername vim'
alias todoman='todo'


# El tiempo
alias wsan='curl wttr.in/"San Vicente de la Barquera"'
alias wbar='curl wttr.in/Barcelona'

# Python envs
alias keras='source ~/.virtualEnvs/keras/bin/activate'


# Nvidia CUDA
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH


