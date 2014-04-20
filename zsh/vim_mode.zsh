# Original Source http://dougblack.io/words/zsh-vi-mode.html
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# show vim status
function zle-line-init zle-keymap-select {
    VIM_PROMPT="${${KEYMAP/vicmd/X}/(main|viins)/ }"
    PROMPT="%{$BLUE%}%m [%{$RED%}${VIM_PROMPT}%{$BLUE%}]: %{$RESET%}";
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1

# Extension to enable vim-like text-objects
# https://github.com/hchbaw/opp.zsh
source ~/.zsh/opp.zsh/*.zsh
