# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/wscrlhs/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/wscrlhs/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/wscrlhs/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/wscrlhs/.fzf/shell/key-bindings.bash"
