#!/usr/bin/env sh


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install latest fzf
FZF_PATH="$HOME"/.fzf
if [ ! -x "$(command -v fzf)" ] && [ ! -d $FZF_PATH ]; then
    git clone https://github.com/junegunn/fzf.git $FZF_PATH
    yes | $FZF_PATH/install
elif [ -d $FZF_PATH ]; then  # update fzf
    cd $FZF_PATH && git pull && (yes | ./install)
fi
