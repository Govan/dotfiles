# Original Source http://dougblack.io/words/zsh-vi-mode.html
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1


function zle-line-init zle-keymap-select {
    PROMPT1="%{$BLUE%}%m%{$RESET%}${${KEYMAP/vicmd/[N]}/(main|viins)/[ ]}: "
    PROMPT=$PROMPT1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


# Extension to enable vim-like text-objects
# https://github.com/hchbaw/opp.zsh
source ~/.zsh/opp.zsh/*.zsh
