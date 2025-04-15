# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/abs2free/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/abs2free/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/abs2free/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/abs2free/.fzf/shell/key-bindings.zsh"
