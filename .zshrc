# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Emacs tramp access - Do not load all the extra stuff
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
if [ `uname` = "Darwin" ]; then
   ssh-add --apple-load-keychain
elif [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent`
    ssh-add
else
    echo "**** Using existing ssh agent ****"
fi

# Do not quit on EOF
set -o ignoreeof

# Useful aliases
alias emax='/Applications/Emacs.app/Contents/MacOS/Emacs &'
alias tao='LANG=C /Applications/Tao3D\ 1.61.app/Contents/MacOS/Tao3D'
alias tao3D='LANG=C /Users/ddd/Work/tao3D/install/Tao3D.app/Contents/MacOS/Tao3D'
alias sourcetree='/Applications/SourceTree.app/Contents/MacOS/SourceTree'
alias fedora='kinit ddd@FEDORAPROJECT.ORG; eval `ssh-agent`; ssh-add ~/.ssh/freedesktop; ssh-add'

# BUG WORKAROUNDS
# Avoiding errors running `make check`, see https://github.com/kata-containers/runtime/issues/2768
export GOPATH=~/go
export GOPROXY="https://proxy.golang.org,direct"


# Path for MacPorts
export PATH=$PATH:/opt/local/bin

# My personal utilities live there
export PATH=$PATH:$HOME/bin:$HOME/go/bin

# Path for LLVM
export PATH=$PATH:/usr/local/Cellar/llvm/11.1.0/bin:/usr/local/Cellar/llvm/12.0.0_1/bin

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ddd"

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
COMPLETION_WAITING_DOTS="true"

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
plugins=(git github z web-search common-aliases dnf brew macos chucknorris)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR=emacsclient
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

# Make sure less (and git log)
# - R: Render colors correctly
# - X: Do not reset screen
# - F: exit if less than one screen
export LESS=-RXF

# Avoid "zsh: no matches found" on things like 'rsync big:foo*`
unsetopt nomatch

# Kubernetes
if which kubectl > /dev/null 2>&1; then
    alias kc=kubectl
fi
if which kubeadm > /dev/null 2>&1; then
    alias ka=kubeadm
fi

alias completions="                     \
    source <(oc completion zsh);        \
    source <(kubectl completion zsh);   \
    complete -F __start_kubectl kc;     \
    source <(kubeadm completion zsh);   \
    complete -F __start_kubeadm ka;     \
    complete -F __start_oc"

unsetopt share_history

chuck_cow
echo "--------------------------------------------------------------------------------"
fortune
echo "--------------------------------------------------------------------------------"
