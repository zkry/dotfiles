# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export GOPATH=/Users/zac/go
export ZSH=/Users/zac/.oh-my-zsh
export CDPATH=/Users/zac/go/src/
export PATH=/Users/zac/bin:$PATH
export PATH=$PATH:~/go/bin
export VIMCONFIG=~/.config/nvim
export VISUAL=nvim # Use Neovim as "preferred editor"
export EDITOR=nvim
export VIMDATA=~/.local/share/nvim


ZSH_THEME=""

alias vim="nvim"
alias 9='9'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vi=nvim
alias depgraph='dep status -dot | dot -T png | open -f -a /Applications/Preview.app'
alias gotime='cd ~/go/src/github.com/zkry/'
alias 11='cd ~/11sight/'
alias 11web='cd ~/11sight/11sight-webapp/'
alias vimsnip='cd ~/.vim/bundle/vim-snippets'
# alias fzvim='nvim $(fzf --height 40%)'
alias fzp="fzf --preview 'cat {}'"
alias groot='cd $(git rev-parse --show-toplevel)'
alias ,='go run'
alias @='fzvim'
alias ':q'='exit'
#alias fzc="fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"

function fzvim () {
    files="$(fzf -m --height 50% --preview 'head -100 {}')"
    echo "$files"
    if [ "$files" ];then
        sfiles=${files//$'\n'/ }
        nvim -O $(echo $sfiles | sed 's/ / /')
    fi
}

alias gora='go run *.go'
alias cs='colorls'
alias lc='colorls -lA --sd'

# Git Shortcuts
alias gdh1='git diff HEAD~1'
alias dockbash='docker run -e HIST_FILE=/root/.bash_history -v=$HOME/.bash_history:/root/.bash_history'

bindkey -v
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode
#
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode bundler web-search z history go emoji kubectl)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -U promptinit; promptinit
prompt pure
# prompt minimal
#source /Users/zac/Desktop/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source /Users/zac/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim='echo "No nesting!"'
    alias vim='echo "No nesting!"'
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zac/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/zac/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zac/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/zac/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
source /Users/zac/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


[[ -s "/Users/zac/.gvm/scripts/gvm" ]] && source "/Users/zac/.gvm/scripts/gvm"
