#!/bin/sh

# Install script for Simics syntax highlighting in VIM

# Installation will put two files in place under $INSTALLDIR
# syntax/simics.vim == highlighting
# ftdetect/simics.vim == filetype detection
SOURCE=https://raw.github.com/mjwade/vim-syntax-simics/tree/master
INSTALLDIR=$HOME/.vim

echo "Thanks for installing!"
echo "This script will install files from this location:"
echo "SOURCE: $SOURCE"
echo "to this location:"
echo "INSTALLDIR: $INSTALLDIR"
echo "Press enter to continue.  Ctrl+c to stop"
read

# Create the needed paths and files
mkdir -p $INSTALLDIR/syntax/simics.vim 
if [ $? -ne 0 ]; then #failed
    EXITCODE=$?
    echo "failed to mkdir -p on $INSTALLDIR/syntax/simics.vim"
    exit $EXITCODE
fi
mkdir -p $INSTALLDIR/ftdetect/simics.vim
if [ $? -ne 0 ]; then #failed
    EXITCODE=$?
    echo "failed to mkdir -p on $INSTALLDIR/ftdetect/simics.vim"
    exit $EXITCODE
fi

# Fill the files 
# NOTE: Assumes you're running this from the web...
echo "Fetching the files simics files from the web."
curl -silent $SOURCE/syntax/simics.vim > $INSTALLDIR/syntax/simics.vim
curl -silent $SOURCE/ftdetect/simics.vim > $INSTALLDIR/ftdetect/simics.vim

# Stuff should be in the files now...
echo "Installation complete."
