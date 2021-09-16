" color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

packadd! gruvbox-material

set colorcolumn=80 " colored column
highlight colorcolumn ctermbg=0 guibg=lightgrey

if has('termguicolors')
    set termguicolors
endif

set background=dark

if !has('gui_running')
    " let g:gruvbox_contrast_dark = 'hard'
    " let g:gruvbox_invert_selection='0'
    " colorscheme gruvbox

    let g:gruvbox_material_background = 'medium'
    " let g:gruvbox_material_enable_italic = 1
    " let g:gruvbox_material_disable_italic_comment = 1

    colorscheme gruvbox-material
endif

" https://github.com/tmux/tmux/issues/1246
" true colors in vim under tmux
" enable true color 启用终端24位色
if exists('+termguicolors')
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif
