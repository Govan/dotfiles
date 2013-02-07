#plugins=(git)

source ~/.zsh/colours.zsh

#############################################
# #set the prompt
RPROMPT="%{$BLUE%}%3c%{$RESET%}";
PROMPT="%{$BLUE%}%m: %{$RESET%}";


#############################################
export PATH=/usr/local/bin:$PATH;
export PATH=$HOME/bin:$PATH;
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR="vim";
export HOSTNAME=`hostname`;

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

#############################################
# if RVM is present for managing rubies
# or if RBENV is present for managing rubies
# And if both rbenv and rvm are present you've got bigger problems to deal with...
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  source "$HOME/.rvm/scripts/rvm";
fi

if [[ -s "$HOME/.rbenv/bin/rbenv" ]]  ; then
  export PATH="$HOME/.rbenv/bin:$PATH" ;
  eval "$(rbenv init -)" ;
fi
#
#############################################
alias kk="clear"

pman() {
  man -t "$*" | open -f -a Preview;
}

unsetopt correct_all
setopt NO_AUTO_CD

#############################################
# Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

#############################################
# Zsh default <ctrl-r> search only matches on the first word on the line -this is nasty.
# Rebind <ctrl-r> to the pattern search which allows us to match multiple words
bindkey "\C-r" history-incremental-pattern-search-backward
##############################################
# Load in your local config
source ~/.zshrc_local

