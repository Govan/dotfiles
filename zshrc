#plugins=(git)

source ~/.zsh/colours.zsh
source ~/.zsh/keybindings.zsh
#############################################
# set the prompt
RPROMPT="%{$BLUE%}%3c%{$RESET%}";
PROMPT="%{$BLUE%}%m: %{$RESET%}";
#############################################
# Configure Autocomplete
autoload -Uz compinit
compinit

# Make completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Highlight the currently selected item in the autocomplete
zstyle ':completion:*:*:*:*:*' menu select
# Allow kill to autocomplete
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

#############################################
# History
HISTFILE=$HOME/.zsh_history

SAVEHIST=1000
HISTSIZE=1000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

#############################################
# Don't prompt for autocorrect on perfectly cromulant commands
unsetopt correct_all
# Don't try to cd into a directory if I type it as ^<name of directory>
setopt NO_AUTO_CD

#############################################
export PATH=/usr/local/bin:$PATH;
export PATH=$HOME/bin:$PATH;
export PATH="/usr/local/heroku/bin:$PATH"

if [[ -d "$HOME/projects/home/bin" ]]  ; then
  export PATH="$HOME/projects/home/bin:$PATH"
fi

export EDITOR="vim";

export HOSTNAME=`hostname`;
# If a command takes longer than 10 seconds, print timing information when it completes
export REPORTTIME=10 ;

#############################################
# Simple Aliases
alias ls='ls -G'
alias b='bundle exec'
alias k="clear"
alias e="vim"
alias pd="cd ~/Documents/Projects/"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
#############################################
# if rbenv is present for managing rubies
if [[ -d "$HOME/.rbenv/shims" ]]  ; then
  export PATH="$HOME/.rbenv/shims:$PATH" ;
  export PATH="$HOME/.rbenv/bin:$PATH" ;
  eval "$(rbenv init -)" ;
fi


##############################################
# Load in your local config
source ~/.zshrc_local

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
