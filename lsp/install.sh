#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


# Install latest nodejs
# Or use apt-get
# sudo apt-get install nodejs
NODEJS=$HOME/soft/node
mkdir -p "$NODEJS"

NODE_SCRIPT=/tmp/install-node.sh
curl --fail -LSs https://install-node.now.sh/latest -o $NODE_SCRIPT
chmod +x $NODE_SCRIPT
PREFIX=$NODEJS $NODE_SCRIPT -y

PATH="$HOME/soft/node/bin:$PATH"
grep \
    'export PATH="$HOME/soft/node/bin:$PATH"' "$HOME"/.bashrc -q \
    || echo 'export PATH="$HOME/soft/node/bin:$PATH"' >> "$HOME"/.bashrc \
    || :

# python & node support
npm i -g neovim

# Change extension names to the extensions you need
npm i -g pyright
