# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wscrlhs/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="fletcherm"
#ZSH_THEME="steeef"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions golang jump docker kubectl zsh-syntax-highlighting autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gm="git merge --no-ff"
alias zte="trans :en"
alias etz="trans :zh"
alias got="go mod tidy"
alias ju="jump"
alias python="python3"

alias viu="vim -u ~/.vim/essential.vim"

alias phpstan='docker run -v $PWD:/app --rm ghcr.io/phpstan/phpstan'

alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'

alias yt='yt-dlp -f "bv+ba/best" --merge-output-format mp4   --proxy socks5://127.0.0.1:1081'

export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export GOPROXY=https://goproxy.io,direct
export log_seelog=false
export log_zaplog=false
export consul_server=localhost
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export PATH="/Users/wscrlhs/go/bin:$PATH"
export PATH="/Users/wscrlhs/bin:$PATH"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fpath=(~/.zsh.d/ $fpath)

alias ctags='/usr/local/bin/ctags'

# 用于vim ctrl-s 保存
stty -ixon
export GVM_ROOT=/Users/wscrlhs/.gvm
. $GVM_ROOT/scripts/gvm-default
export GO111MODULE=on
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# 防止从剪贴板粘贴url到iterm2时会被转义
DISABLE_MAGIC_FUNCTIONS=true
fpath=(~/.zsh.d/ $fpath)
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
#export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
export PATH="/usr/local/opt/zookeeper/bin:$PATH"

export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export EDITOR=vim
alias tm="tmuxifier"


source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

alias cdd='cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/wscrlhs/radioconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/wscrlhs/radioconda/etc/profile.d/conda.sh" ]; then
        . "/Users/wscrlhs/radioconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/wscrlhs/radioconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/llvm/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
alias lg="lazygit"
alias yt="yt-dlp -f "bv+ba/best" --merge-output-format mp4   --proxy socks5://127.0.0.1:7890"
alias vds="cralwer search --config /Users/wscrlhs/bin --name "

eval $(thefuck --alias)
eval "$(zoxide init zsh)"

alias kk="kubectl"
alias m="minikube"
alias ff="ffmpeg -hide_banner"
