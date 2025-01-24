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

# include local scripts
export PATH="/home/pablo/.local/bin:$PATH"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit wait lucid for zsh-users/zsh-completions
zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# Add in snippets
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZP::git
zinit snippet OMZP::fzf
zinit snippet OMZP::sudo
zinit snippet OMZP::docker-compose

# Completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# History
HISTSIZE=5000
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
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true

# Aliases
alias ls="exa --icons "
alias icat="wezterm imgcat "

# Load starship theme
zinit ice as"command" from"gh-r" \
   atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
   atpull"%atclone" src"init.zsh"
zinit light starship/starship

# custom scripts
autoload -Uz $HOME/.dotfiles/zscripts/*

# direnv
eval "$(direnv hook zsh)"
