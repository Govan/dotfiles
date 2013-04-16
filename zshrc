#plugins=(git)

source ~/.zsh/colours.zsh
source ~/.zsh/keybindings.zsh


#############################################
# set the prompt
RPROMPT="%{$BLUE%}%3c%{$RESET%}";
PROMPT="%{$BLUE%}%m: %{$RESET%}";

#############################################
# Simple Aliases
alias ls='ls -G'
alias be='bundle exec'
alias kk="clear"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'


#############################################
export PATH=/usr/local/bin:$PATH;
export PATH=$HOME/bin:$PATH;
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR="vim";
export HOSTNAME=`hostname`;
export REPORTTIME=10 ;

#############################################
# if RVM is present for managing rubies
# or if RBENV is present for managing rubies
# And if both rbenv and rvm are present you've got bigger problems to deal with...
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  source "$HOME/.rvm/scripts/rvm";
fi

if [[ -s "$HOME/.rbenv/bin/rbenv" ]]  ; then
  export PATH="$HOME/.rbenv/shims:$PATH" ;
  export PATH="$HOME/.rbenv/bin:$PATH" ;
  eval "$(rbenv init -)" ;
fi

#############################################
unsetopt correct_all
setopt NO_AUTO_CD

#############################################
# Configure tab complete
#
autoload -Uz compinit
compinit
# Make completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Next 4 lines were cargo-culted from oh-my-zsh
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

#############################################
# Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

# Zsh default <ctrl-r> search only matches on the first word on the line -this is nasty.
# Rebind <ctrl-r> to the pattern search which allows us to match multiple words
bindkey "\C-r" history-incremental-pattern-search-backward

#############################################
# Pretty format man pages
pman() {
  man -t "$*" | open -f -a Preview;
}

##############################################
# Load in your local config
source ~/.zshrc_local

