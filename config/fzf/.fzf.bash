# Setup fzf
# ---------
if [[ ! "$PATH" == */home/agutierrez/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/agutierrez/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/agutierrez/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/agutierrez/.fzf/shell/key-bindings.bash"
