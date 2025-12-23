export EDITOR="nano"
export PYTHONPATH=""
export AUTOSWITCH_VIRTUAL_ENV_DIR="."
export PATH="/home/pablo/.local/bin:$PATH"

# Aliases
alias ls="eza --icons=auto "
alias icat="wezterm imgcat "

# zsh autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="64"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt autocd
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true

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
zinit snippet OMZL::key-bindings.zsh

zinit wait lucid light-mode for \
  OMZP::fzf \
  MichaelAquilina/zsh-autoswitch-virtualenv \
  OMZP::sudo \
  atinit"zicompinit; zicdreplay" nocd \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" nocd \
    zsh-users/zsh-autosuggestions \
  atload OMZP::git \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
  as"completion" OMZP::docker-compose

# direnv
zinit as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
   atpull'%atclone' pick"direnv" src"zhook.zsh" for \
      direnv/direnv

# Load starship theme
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

# custom scripts
autoload -Uz $HOME/.dotfiles/zscripts/*

eval "$(zoxide init zsh)"
