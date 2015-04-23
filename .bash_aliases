#!/bin/bash

alias shutdown='cd ~/; .i3/exit; sudo /sbin/shutdown'
alias reboot='cd ~/; .i3/exit; sudo /sbin/reboot'

# simple solution to start weeks with monday
alias cal='ncal -C'

# git shortcuts
alias st='git status'
alias co='git checkout'
alias branch='git branch'
alias branchr='git branch --remote'
alias remote='git branch --remote'
alias com='git commit'
alias commit='git commit'
alias add='git add'
alias del='git remove'
alias push='git push'
alias fetch='git fetch'
alias merge='git merge'
alias pull='git pull'
alias dg='git diff --color'
alias gitdiff='dg'
alias lg="git lg"

# create random passwords of 15 chars length
alias pwgen='cat /dev/urandom | tr -cd "[:alnum:]" | head -c 15; echo ""'


# load environment specific aliases
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
