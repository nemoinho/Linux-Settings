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

# Only update if the settings already exists
if [ -f $SETTINGSDIR/install.sh ]; then
    cd $SETTINGSDIR
    git pull
    if [ -f update.sh ]; then
        ./update.sh
    fi
    exit;
fi

mkdir -p $SETTINGSDIR

cd $OPTDIR

git clone https://github.com/nemoinho/Linux-Settings.git $SETTINGSDIR

cd $SETTINGSDIR

if [ -d save ]; then
    mv save old_save
fi

mkdir -p save

if [ -d old_save ]; then
    mv old_save save
fi

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
    cp ~/.bashrc save
    rm ~/.bashrc
fi
ln -s ${SETTINGSDIR}/.bashrc ${HOMEDIR}/.bashrc

if [ -f ~/.bash_os ]; then
    cp ~/.bash_os save
    rm ~/.bash_os
fi
ln -s ${SETTINGSDIR}/.bash_os ${HOMEDIR}/.bash_os

if [ -f ~/.bash_aliases ]; then
    cp ~/.bash_aliases save
    rm ~/.bash_aliases
fi
ln -s ${SETTINGSDIR}/.bash_aliases ${HOMEDIR}/.bash_aliases

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
    ln -s $SETTINGSDIR/$file ~/$file
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
    ln -s $SETTINGSDIR/$file ~/$file
done

if [ -f ~/.vimrc ]; then
    cp ~/.vimrc save
    rm ~/.vimrc
fi
ln -s ${SETTINGSDIR}/.vimrc ${HOMEDIR}/.vimrc

# 5. ~/.gitconfig
if [ -f ~/.gitconfig ]; then
    cp ~/.gitconfig save
    rm ~/.gitconfig
fi
ln -s ${SETTINGSDIR}/.gitconfig ${HOMEDIR}/.gitconfig

if [ -f ~/.gitlocalignore ]; then
    cp ~/.gitlocalignore save
    rm ~/.gitlocalignore
fi
ln -s ${SETTINGSDIR}/.gitlocalignore ${HOMEDIR}/.gitlocalignore
