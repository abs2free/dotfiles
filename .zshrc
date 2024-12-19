# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/abs2free/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
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
plugins=(git fast-syntax-highlighting zsh-autosuggestions zsh-interactive-cd
    golang jump docker kubectl zsh-syntax-highlighting auto-notify fzf
    autojump web-search zsh-completions zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
alias ctags='/usr/local/bin/ctags'
alias tm="tmuxifier"
#alias cdd='cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"'
alias lg="lazygit"
alias yt="yt-dlp -f "bv+ba/best" --merge-output-format mp4   --proxy socks5://127.0.0.1:7890"
alias vds="cralwer search --config /Users/abs2free/bin --name "
alias k="kubectl"
alias m="minikube"
alias ff="ffmpeg -hide_banner"
alias ms="minikube --memory 8192 --cpus 4 start"
alias mstart="minikube --nodes 4 --memory 5120 --cpus 3 start"
alias t="task"
alias tl='task --list-all'
alias mk="make"
alias ngc="nix-store --gc"
alias vpn="sh ~/bin/vpn.sh"
alias tx="tmux"

# path
export GOPROXY=https://goproxy.io,direct
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/Users/abs2free/go/bin:$PATH"
export PATH="/Users/abs2free/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/zookeeper/bin:$PATH"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"


#export GVM_ROOT=/Users/abs2free/.gvm
#. $GVM_ROOT/scripts/gvm-default
export GO111MODULE=on
export EDITOR=vim

# 防止从剪贴板粘贴url到iterm2时会被转义
DISABLE_MAGIC_FUNCTIONS=true

# eval
eval $(thefuck --alias)
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# ---- FZF -----

# --- setup fzf theme ---
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'
# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'
# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# 默认使用 fd 命令查找文件，速度更快（需要先安装 fd: brew install fd）
# 使用 fd 时排除某些目录 (例如 .git, node_modules)
export FZF_DEFAULT_COMMAND='fd --type f -E .git -E node_modules'
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"
export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}  
--height 100%
--exact"

# 设置 Ctrl+T 快捷键绑定的命令，用于查找文件。
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" # Ctrl+T 绑定的命令
#设置 Ctrl+T 的选项，--preview 可以在 FZF 窗口中预览文件内容。使用 bat 可以提供语法高亮。
export FZF_CTRL_T_OPTS="--preview 'head -n 500 | bat --style=numbers --color=always {}'"

export FZF_ALT_C_COMMAND='fd --type d' # Alt+C 绑定的命令，用于快速切换目录
export FZF_ALT_C_OPTS="--preview 'tree {}'" #Alt + c预览目录树

# 历史命令搜索增强
export FZF_CTRL_R_OPTS="--preview 'echo {}'"

# 使用 ag (The Silver Searcher) 替代 fd，如果你的项目代码量巨大，ag 可能更快 (需要先安装 ag: brew install the_silver_searcher)
# export FZF_DEFAULT_COMMAND='ag -l "" .'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}
