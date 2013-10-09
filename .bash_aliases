alias shutdown='cd ~/; .i3/exit; sudo /sbin/shutdown'
alias reboot='cd ~/; .i3/exit; sudo /sbin/reboot'
alias mplayer='rm ~/.mplayer_fifo; mkfifo ~/.mplayer_fifo; while (pidof mplayer); do cat ~/.mplayer_fifo; done | mplayer -slave '
