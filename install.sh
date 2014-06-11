#!/usr/bin/env sh
# This file sets the system up to use these configurations of bash, local-bin
# i3 and vim
#
# To install these configuration use this command:
# wget -O- https://raw.githubusercontent.com/nemoinho/Linux-Settings/master/install.sh | bash
#

cd ~/

HOMEDIR=$(pwd)
SETTINGSDIR=$HOMEDIR'/opt/Linux-Settings'
OPTDIR=$(dirname $SETTINGSDIR)

mkdir -p $SETTINGSDIR

cd $OPTDIR

git clone https://github.com/nemoinho/Linux-Settings.git $SETTINGSDIR

cd $SETTINGSDIR

mkdir -p save

# 1. ~/bin
# save previous settings for bin
if [ -d ~/bin ]; then
    find ~/bin -type f | while read file; do
        FILENAME=$(basename "$file")
        DIRNAME=$(dirname "$file")
        DIRNAME=$(perl -e 'print substr "'$DIRNAME'", (length "'$HOMEDIR'")')
        mkdir -p "save$DIRNAME"
        cp "$file" "save$DIRNAME/$FILENAME"
    done
else
    mkdir ~/bin
fi

find bin -type f | while read file; do
    if [ -f ~/$file ]; then
        rm ~/$file
    fi
    ln $file ~/$file
done

# 2. ~/.bashrc
if [ -f ~/.bashrc ]; then
    mv ~/.bashrc save
fi
cp .bashrc ~/

if [ -f ~/.bash_os ]; then
    mv ~/.bash_os save
fi
cp .bash_os ~/

if [ -f ~/.bash_aliases ]; then
    mv ~/.bash_aliases save
fi
cp .bash_aliases ~/

# 3. ~/.i3
# save previous settings for .i3
if [ -d ~/.i3 ]; then
    find ~/.i3 -type f | while read file; do
        FILENAME=$(basename "$file")
        DIRNAME=$(dirname "$file")
        DIRNAME=$(perl -e 'print substr "'$DIRNAME'", (length "'$HOMEDIR'")')
        mkdir -p "save$DIRNAME"
        cp "$file" "save$DIRNAME/$FILENAME"
    done
else
    mkdir ~/.i3
fi

find .i3 -type f | while read file; do
    if [ -f ~/$file ]; then
        rm ~/$file
    fi
    ln $file ~/$file
done

# 4. ~/.vimrc and ~/.vim
# save previous settings for .vim
if [ -d ~/.vim ]; then
    find ~/.vim -type f | while read file; do
        FILENAME=$(basename "$file")
        DIRNAME=$(dirname "$file")
        DIRNAME=$(perl -e 'print substr "'$DIRNAME'", (length "'$HOMEDIR'")')
        mkdir -p "save$DIRNAME"
        cp "$file" "save$DIRNAME/$FILENAME"
    done
else
    mkdir ~/.vim
fi

find .vim -type f | while read file; do
    if [ -f ~/$file ]; then
        rm ~/$file
    fi
    ln $file ~/$file
done

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc save
fi
cp .vimrc ~/

# 5. ~/.gitconfig
if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig save
fi
cp .gitconfig ~/

if [ -f ~/.gitlocalignore ]; then
    mv ~/.gitlocalignore save
fi
ln .gitlocalignore ~/.gitlocalignore
