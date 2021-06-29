#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


# Install latest nodejs
# Or use apt-get
# sudo apt-get install nodejs
# if [ ! -x "$(command -v node)" ]; then
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
# fi

# Install yarn
# if [ ! -x "$(command -v yarn)" ]; then
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
# fi

# Use package feature to install coc.nvim
if [ ! -x "$(command -v nvim)" ] && [ ! -x "$(command -v "$HOME"/.local/nvim/bin/nvim)" ]; then
    # for vim8
    NVIM_PACK=~/.vim/pack/coc/start
else
    # for neovim
    NVIM_PACK=~/.local/share/nvim/site/pack/coc/start
fi
# python & node support
npm i -g neovim
mkdir -p $NVIM_PACK
cd $NVIM_PACK
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
    echo '{"dependencies":{}}' > package.json
fi

# Change extension names to the extensions you need
npm install coc-pyright --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-clangd --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
npm install coc-java --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
