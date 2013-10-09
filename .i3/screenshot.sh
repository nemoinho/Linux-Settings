#!/usr/bin/env sh

SCREEN_DIR=~/Bilder/screenshots
#SCREEN_PROMPT=1
SCROT_OR_IMPORT='scrot'

window='root'

case $1 in
	root)
		focused=''
		window='root';;
	active)
		focused='-u'
		window=`xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | cut -d' ' -f5`;;
esac

[ ! -z "$SCREEN_PROMPT" ] && \
  name=`i3-input -P 'screen-name: ' | sed -n '/command = /s/command = //p'`

if [ -z "$name" ];then
  if [ $window == "root" ];then
    name='root'
  else
    name=`xprop -id $window | sed -n '/WM_CLASS/s/.* = "\([^\"]*\)".*/\1\n/p'`
    [ -z "$name" ] && name='window'
  fi
fi

filename="$name-`date +%Y-%m-%d_%H-%M-%S`.png"

#scrot
if [ "$SCROT_OR_IMPORT" == "scrot" ]
then
	scrot --border $focused -q 100 "$SCREEN_DIR/$filename"
else
#import
	import -border -window $window "$SCREEN_DIR/$filename"
fi


ln -sf "$filename" $SCREEN_DIR/last

exit

