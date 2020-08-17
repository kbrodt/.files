#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


NEOVIM=$HOME/soft/neovim
# Install latest nodejs
if [ ! -x "$(command -v nvim)" ]; then
    if [ ! -d "$NEOVIM" ]; then
        mkdir -p "$NEOVIM"
        git clone https://github.com/neovim/neovim.git "$NEOVIM"
    fi

    cd "$NEOVIM"

    make CMAKE_BUILD_TYPE=Release -j8
    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="$HOME"/.local/nvim install

    echo 'export PATH="$HOME/.local/nvim/bin:$PATH"' >> "$HOME"/.bashrc
fi
