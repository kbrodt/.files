" General settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

" Themes
source $HOME/.config/nvim/themes/gruvbox.vim
" source $HOME/.config/nvim/themes/onedark.vim

" Plugin configuraions
source $HOME/.config/nvim/plug-config/python-syntax.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim

if has('nvim')
    luafile $HOME/.config/nvim/lua/lsp-config.lua
    luafile $HOME/.config/nvim/lua/nvim-cmp.lua
endif
