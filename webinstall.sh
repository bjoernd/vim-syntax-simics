#!/bin/sh

# Install script for Simics syntax highlighting in VIM
set -e
set -u

# Installation will put two files in place under $INSTALLDIR
# syntax/simics.vim == highlighting
# ftdetect/simics.vim == filetype detection
SOURCE=https://raw.github.com/mjwade/vim-syntax-simics/master
INSTALLDIR=$HOME/.vim

echo "\nInstalling vim-syntax-simics"

# Create the needed paths and files
echo "\t-Making subdirs in $HOME/.vim"
mkdir -p $INSTALLDIR/syntax/
if [ $? -ne 0 ]; then #failed
    EXITCODE=$?
    echo "failed to mkdir -p on $INSTALLDIR/syntax/simics.vim"
    exit $EXITCODE
fi
mkdir -p $INSTALLDIR/ftdetect/
if [ $? -ne 0 ]; then #failed
    EXITCODE=$?
    echo "failed to mkdir -p on $INSTALLDIR/ftdetect/simics.vim"
    exit $EXITCODE
fi

# Fill the files 
# NOTE: Assumes you're running this from the web...
echo "\t-Fetching the vim-simics files from the web"
curl --raw --silent $SOURCE/syntax/simics.vim > $INSTALLDIR/syntax/simics.vim
curl --raw --silent $SOURCE/ftdetect/simics.vim > $INSTALLDIR/ftdetect/simics.vim

# Stuff should be in the files now...
echo "Installation is complete.  Enjoy!"
