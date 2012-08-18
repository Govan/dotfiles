# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="leftbrained"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

export DISABLE_AUTO_UPDATE="true";
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH;
export PATH=$HOME/bin:$PATH;

#############################################
# RVM for managing rubies
export PATH=$HOME/.rvm/bin:$PATH; 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
#############################################
alias kk="clear"


unsetopt correct_all
setopt NO_AUTO_CD

#############################################
# Up-arrow search on zsh only matches against the first word
# this will make it match against everything up to the cursor.
# In other words: multi-word search
# NOPE, TURNS OUT THIS DOESN'T WORK 
# http://unix.stackexchange.com/questions/16101/zsh-search-history-on-up-and-down-keys
up-line-or-search-prefix () {
  local CURSOR_before_search=$CURSOR
  zle up-line-or-search "$LBUFFER"
  CURSOR=$CURSOR_before_search
}
zle -N up-line-or-search-prefix
##############################################

stty stop undef
stty start undef
