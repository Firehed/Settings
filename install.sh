#!/bin/sh

files=(vim bash_profile bashrc screenrc inputrc ackrc gitconfig gitignore ripgreprc)

# Trick to get absolute path to this script
# http://stackoverflow.com/a/4774063
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`

# Update submodules (e.g. vim plugins) while in known directory
git submodule init
git submodule update

popd > /dev/null

echo "Run these to symlink the dotfiles:"
echo ""
for file in ${files[@]}; do
    echo ln -Fs $SCRIPTPATH/$file $HOME/.$file
done
