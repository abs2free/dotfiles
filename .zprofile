# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Applications/MarkText.app/Contents/MacOS"


# Added by Toolbox App
export PATH="$PATH:/usr/local/bin"


# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

eval "$(/opt/homebrew/bin/brew shellenv)"
