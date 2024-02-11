#!/usr/bin/bash

# Make this script's directory the current directory
SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"


cp ./.emacs ~/
# cp ./.tmux.conf ~/
# cp ./.vimrc ~/
# TODO: Something different for linux
cp -r ./helix $HOME/AppData/Roaming

