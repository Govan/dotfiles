bindkey -v
####################################################
# Keybindings was cargo-culted
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

####################################################
# Use jk to exit insert mode.
# This does not work, and I'm buggered if I can work out why
bindkey -M viins 'jk' vi-cmd-mode

####################################################
# show vim status as an [X] on the PROMPT
function zle-line-init zle-keymap-select {
    VIM_PROMPT="${${KEYMAP/vicmd/◆}/(opp)/M}"
    VIM_PROMPT="${VIM_PROMPT/(main|viins)/ }"

    STYLED_VIM_PROMPT="%{$fg[yellow]%}[%{$fg[red]%}${VIM_PROMPT}%{$fg[yellow]%}]"
    
    # I don't like this being here, I'd prefer to build up the prompt independently and then set the final prompt at the last stage
    RUBY_PROMPT="";
    if which rbenv &> /dev/null ; then
      ruby_version=`rbenv version-name`
      RUBY_PROMPT="%{$fg[yellow]%}[%{$fg[red]%}${ruby_version}%{$fg[yellow]%}]";
    fi
    HOST_PROMPT="$fg[yellow]%}[%{$fg[magenta]%}%m%{$fg[yellow]%}]"
    DIR_PROMPT="[%{$fg[green]%}${PWD/#$HOME/~}%{$fg[yellow]%}]"
    TYPE_PROMPT="%{$fg[yellow]%}>"

    TIME_PROMPT="%{$fg[grey]%}[%D{%L:%M:%S}]"

    PROMPT="$STYLED_VIM_PROMPT $HOST_PROMPT $DIR_PROMPT $RUBY_PROMPT $TIME_PROMPT %{$reset_color%}
$TYPE_PROMPT %{$reset_color%}";


    zle reset-prompt
}

TMOUT=1
TRAPALRM() {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#################################################
# reduce the lag when swapping modes
export KEYTIMEOUT=1

# Extension to enable vim-like text-objects
# https://github.com/hchbaw/opp.zsh
source ~/.zsh/opp.zsh/*.zsh
