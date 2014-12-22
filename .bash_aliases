#!/bin/bash

alias shutdown='cd ~/; .i3/exit; sudo /sbin/shutdown'
alias reboot='cd ~/; .i3/exit; sudo /sbin/reboot'

# simple solution to start weeks with monday
alias cal='ncal -C'

# git shortcuts
alias st='git status'
alias dg='git diff --color'
alias gitdiff='dg'
alias lg="git log --graph --all --color --format='%C(yellow)%h %C(bold red)%d %Creset%s %Cgreen(%cr) %C(bold blue)<%an>'"

# create random passwords of 15 chars length
alias pwgen='cat /dev/urandom | tr -cd [:alnum:] | head -c 15; echo ""'


# load environment specific aliases
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
