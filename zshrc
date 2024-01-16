export EDITOR="nano"

# python multithread
export MKL_NUM_THREADS=16
export NUMEXPR_NUM_THREADS=16
export OMP_NUM_THREADS=16

# zsh autoswith virtualenv
export AUTOSWITCH_VIRTUAL_ENV_DIR="."

# 16 threads compilation
export MAKEFLAGS="-j16"

# direnv
eval "$(direnv hook zsh)"

# poetry
export PATH="/home/pablo/.local/bin:$PATH"

# Completions
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
# ZSH_HIGHLIGHT_DIRS_BLACKLIST=(/*(/))

# zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# Path to your oh-my-zsh installation.
export ZSH="/home/pablo/.oh-my-zsh"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git sudo fzf autoswitch_virtualenv
)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nano ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='exa --icons'
alias icat="kitty +kitten icat"

# Ignore corrections
alias flask='nocorrect flask'
alias asusctl='nocorrect asusctl'

# starship shell
eval "$(starship init zsh)"

# custom scripts
autoload -Uz $HOME/.dotfiles/zscripts/*
