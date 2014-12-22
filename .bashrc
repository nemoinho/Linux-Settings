# OS definitions.
# If the OS will predefine some commands put all these predefines into a
# seperate file like ~/.bach_os, instead of adding them here directly.

if [ -f ~/.bash_os ]; then
    . ~/.bash_os
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

export EDITOR=vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Colorized and extended prompt for git

if [ -d /usr/lib/git-core ]; then
	GIT_PS1_SHOWCOLORHINTS=1 
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_SHOWUPSTREAM='auto'
	PS1='\u@\h:\w\a$(__git_ps1 " (%s)")\$ '
	if [ -f /usr/lib/git-core/git-sh-prompt ]; then
		. /usr/lib/git-core/git-sh-prompt
		PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
	fi
fi

# A new saying when the bach is starting
if [ "`which fortune`" != "" ] && [ "`which cowsay`" != "" ]; then
	fortune | cowsay -f tux
fi
