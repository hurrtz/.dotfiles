# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hurrtz/.fzf/bin* ]]; then
  export PATH="$PATH:/home/hurrtz/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hurrtz/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/hurrtz/.fzf/shell/key-bindings.bash"

