#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


[ -x "$(command -v python3)" ] && alias python="python3"
python -m pip install --upgrade pip
python -m pip install --upgrade jedi
python -m pip install --upgrade black
python -m pip install --upgrade rope
python -m pip install --upgrade flake8
python -m pip install --upgrade mypy

NODEJS=$HOME/soft/node
# Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
    mkdir -p "$NODEJS"
    NODE_SCRIPT=/tmp/install-node.sh
    curl --fail -LSs https://install-node.now.sh/latest -o $NODE_SCRIPT
    chmod +x $NODE_SCRIPT
    PREFIX=$NODEJS $NODE_SCRIPT -y
    PATH="$HOME/soft/node/bin:$PATH"
    echo 'export PATH="$HOME/soft/node/bin:$PATH"' >> "$HOME"/.bashrc
    # Or use apt-get
    # sudo apt-get install nodejs
fi

if [ ! -x "$(command -v yarn)" ]; then
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
fi

# Use package feature to install coc.nvim

if [ ! -x "$(command -v nvim)" ] && [ ! -x "$(command -v "$HOME"/.local/nvim/bin/nvim)" ]; then
    # for vim8
    mkdir -p ~/.vim/pack/coc/start
    cd ~/.vim/pack/coc/start
    curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
else
    python -m pip install pynvim
    npm i -g neovim

    # for neovim
    mkdir -p ~/.local/share/nvim/site/pack/coc/start
    cd ~/.local/share/nvim/site/pack/coc/start
    curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
fi

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
	  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-python --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
