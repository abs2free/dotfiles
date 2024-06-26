alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias vim=/usr/local/bin/vim


# Define the qcd function
qcd(){
# Accept 1 argument that's a string key, and perform a different # "cd" operation for each key.
case "$1" in
    work)
      cd $HOME/Work/Projects/Web/src/include
      ;;
    recipes)
      cd $HOME/Family/Cooking/Recipes
      ;;
    video)
      cd /data/Arts/Video/Collection
      ;;
    beatles)
      cd $HOME/Music/mp3/Artists/B/Beatles
      ;;
*)
# The supplied argument was not one of the supported keys echo "qcd: unknown key '$1'"
return 1
;;
esac
  # Helpfully print the current directory name to indicate where you are
pwd
}
# Set up tab completion
complete -W "work recipes video beatles" qcd

open_with_fzf() {
  fzf --preview='head -$LINES {}'                                                                                                                                                                         [9:00:06]
}

cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

