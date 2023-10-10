#!/usr/bin/env bash


set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


NEOVIM=$HOME/soft/neovim
if [ ! -x "$(command -v nvim)" ]; then
    if [ ! -d "$NEOVIM" ]; then
        mkdir -p "$NEOVIM"
        git clone https://github.com/neovim/neovim.git "$NEOVIM"
    fi

    cd "$NEOVIM"

    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="${HOME}"/.local
    make install
elif [ -d "$NEOVIM" ]; then  # update
    cd "$NEOVIM"
    git pull

    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="${HOME}"/.local
    make install
fi


# plugins

PLUGIN_DIR=$HOME/.local/share/nvim/site/pack/default/start
mkdir -p $PLUGIN_DIR
cd $PLUGIN_DIR

for repo in \
    https://github.com/SirVer/ultisnips.git \
    https://github.com/hrsh7th/cmp-buffer.git \
    https://github.com/hrsh7th/cmp-nvim-lsp-signature-help.git \
    https://github.com/hrsh7th/cmp-nvim-lsp.git \
    https://github.com/hrsh7th/cmp-path \
    https://github.com/hrsh7th/nvim-cmp.git \
    https://github.com/itchyny/lightline.vim \
    https://github.com/lervag/vimtex.git \
    https://github.com/mg979/vim-visual-multi.git \
    https://github.com/neovim/nvim-lspconfig.git \
    https://github.com/nvim-lua/plenary.nvim.git \
    https://github.com/nvim-telescope/telescope.nvim.git \
    https://github.com/nvim-treesitter/nvim-treesitter.git \
    https://github.com/sainnhe/gruvbox-material.git \
    https://github.com/vimwiki/vimwiki.git \
    ; do
    repo_dir=$(basename "${repo}" | sed "s/\.git$//")
    echo $repo_dir
    if [ -d "${repo_dir}" ]; then
        cd "${repo_dir}" && git pull && cd ..
    else
        git clone \
            --depth 1 \
            "${repo}" \

    fi
done
