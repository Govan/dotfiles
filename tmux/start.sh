#!/bin/sh 
# Taken from 
# http://www.huyng.com/posts/productivity-boost-with-tmux-iterm2-workspaces/
export PATH=$PATH:/usr/local/bin
# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0 

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=( "None" "New Session" $(tmux list-sessions -F "#S") )
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
    case $opt in
        "None")
            zsh --login
            break;;
        "New Session")
            read -p "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            break
            ;;
        *) 
            tmux attach-session -t $opt 
            break
            ;; 
    esac
done    
