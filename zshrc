#############################################
# Disable flow control so I can remap ctl-s to save in vim
stty start undef
stty stop undef
stty -ixon -ixoff

source ~/.zsh/colours.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/dash.zsh
source ~/.zsh/vim_mode.zsh
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#############################################
# Configure AutoComplete
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
HISTFILE="$HOME/Tresors/Code/home/zsh_history/`hostname -s`"

SAVEHIST=999999999
HISTSIZE=999999999

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

# Grep backwards through history with up-arrow
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# In command mode, grep with 'n' or 't'
bindkey -M vicmd "n" up-line-or-beginning-search # Up
bindkey -M vicmd "t" down-line-or-beginning-search # Down

# Bind 's' to forward char in command mode. It's more Dvoraky.
bindkey -M vicmd "s" forward-char
#############################################
# Don't prompt for autocorrect on perfectly cromulant commands
unsetopt correct_all

# Try to cd into a directory if I type it as ^<name of directory>
setopt AUTO_CD

#############################################
export PATH=/usr/local/bin:$PATH;
export PATH=$HOME/code/home/bin:$PATH;
export PATH=$PATH:$HOME/Hive/Code/Home/bin;
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
alias top="htop"
alias wat="tldr"

export c=~/Code
export hc=~/Code/home
export hc=~/Hive/Code
export hh=~/Hive/Code/home
export i=~/Hive/Inbox

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
# Draw a dividing line
hr(){
  printf '%*s\n' $(tput cols) '' | tr ' ' -;
}
#############################################
# Set preferences for Vagrant
#export VAGRANT_DEFAULT_PROVIDER="vmware_fusion" ;

# On a mac, prefer mvim in terminal mode
type nvim >/dev/null 2>&1 && {
  alias vim='nvim'
}
#############################################
# Ctl P to push a new line then restore the previous
# line afterwards. Useful for creating that directory you for got
# about or checking man.
bindkey '^P' push-line-or-edit

source /usr/local/Cellar/fzf/0.17.3/shell/completion.zsh
source /usr/local/Cellar/fzf/0.17.3/shell/key-bindings.zsh

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

# Load in your local config
source ~/.zshrc_local
