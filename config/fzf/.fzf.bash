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

# fif
# ---
# Searching in files: https://github.com/junegunn/fzf/wiki/examples

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
