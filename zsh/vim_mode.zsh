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
    VIM_PROMPT="${${KEYMAP/vicmd/X}/(main|viins)/ }"
    PROMPT="%{$BLUE%}%m [%{$RED%}${VIM_PROMPT}%{$BLUE%}]: %{$RESET%}";
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
