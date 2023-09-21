" General settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

" Themes
source $HOME/.config/nvim/themes/gruvbox.vim

" Plugin configurations
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/ultisnip.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim

if has('nvim')
    luafile $HOME/.config/nvim/lua/lsp-config.lua
    luafile $HOME/.config/nvim/lua/nvim-cmp.lua
    luafile $HOME/.config/nvim/lua/telescope_config.lua
    luafile $HOME/.config/nvim/lua/treesitter.lua
endif
