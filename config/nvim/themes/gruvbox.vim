" color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set colorcolumn=80 " colored column
highlight colorcolumn ctermbg=0 guibg=lightgrey

if has('termguicolors')
    set termguicolors
endif

if has('gui_running')
    set background=dark
elseif &t_Co < 256
    colorscheme default
    set nocursorline
else
    set background=dark

    " let g:gruvbox_contrast_dark = 'hard'
    " let g:gruvbox_invert_selection='0'
    " colorscheme gruvbox

    let g:gruvbox_material_background = 'hard'
    colorscheme gruvbox-material
endif

" https://github.com/tmux/tmux/issues/1246
" true colors in vim under tmux
" enable true color 启用终端24位色
if exists('+termguicolors')
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif
