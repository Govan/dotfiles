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
    PROMPT="%{$fg[yellow]%}[%{$fg[red]%}${VIM_PROMPT}%{$fg[yellow]%}] $fg[yellow]%}[%{$fg[magenta]%}%m%{$fg[yellow]%}] [%{$fg[green]%}${PWD/#$HOME/~}%{$fg[yellow]%}]%{$reset_color%}
%{$fg[yellow]%}> %{$reset_color%}";
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
