#!/bin/bash
# ~/.bash_profile: executed by bash(1) for login shells

if shopt -q login_shell
then
    if [ -f ~/.bash_login ]
    then
        . ~/.bash_login
    fi
fi

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"

# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'
echo profile

if shopt -q login_shell
then
    if [ -f ~/.profile ]
    then
        . ~/.profile
    fi
else 
    . ~/.bashrc
fi