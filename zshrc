#plugins=(git)

#############################################
# Disable flow control so I can remap ctl-s to save in vim
stty start undef
stty stop undef

source ~/.zsh/colours.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/dash.zsh
#############################################
# set the prompt
RPROMPT="%{$BLUE%}%3c%{$RESET%}";
PROMPT="%{$BLUE%}%m: %{$RESET%}";
#############################################
# Configure Autocomplete
autoload -Uz compinit
compinit -i

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
export PATH=$HOME/Documents/code/home/bin:$PATH;
export PATH="/usr/local/heroku/bin:$PATH"

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
alias q="exit"

export d=~/Dropbox/me
export c=~/Documents/code
export h=~/Documents/code/home
export i=~/Dropbox/Me/inbox

alias ..='cd ./..'
alias ...='cd ./../..'
#############################################
# if rbenv is present for managing rubies
if [[ -d "$HOME/.rbenv/shims" ]]  ; then
  export PATH="$HOME/.rbenv/shims:$PATH" ;
  export PATH="$HOME/.rbenv/bin:$PATH" ;
  eval "$(rbenv init -)" ;
fi

#############################################
# Set preferences for Vagrant
export VAGRANT_DEFAULT_PROVIDER="virtualbox" ;


# On a mac, prefer mvim in terminal mode
type mvim >/dev/null 2>&1 && { 
  # Log command history in vim so I can see where I'm spending time
  # http://www.drbunsen.org/vim-croquet/
  alias vim='mvim -v' # -w ~/Documents/code/vim-croquet/vimlog "$@"' 
}

#############################################
# Ctl P to push a new line then restore the previous
# line afterwards. Useful for creating that directory you for got 
# about or checking man.
bindkey '^P' push-line-or-edit


##############################################
# Let's play with vim mode!
source ~/.zsh/vim_mode.zsh

##############################################


# Load in your local config
source ~/.zshrc_local
