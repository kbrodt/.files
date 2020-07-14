" vim is based on vi. setting `nocompatible` switches from the default
" vi-compatibility mode and enables useful vim functionality. this
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because vim automatically enters nocompatible mode if that file
" is present. but we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then vim started with
" `vim -u foo`).
set nocompatible


" =============================================================================
"  editor settings
" =============================================================================

" Spaces and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4  " Insert 4 spaces on a tab
set expandtab     " tabs are spaces, mainly because of python
set smartindent   " Vim tries to do its best job to indent

" UI config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nu                  " Show line numbers.
set relativenumber
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Always display the statusline in all windows
set showtabline=2       " Always display the tabline, even if there is only one tab
set noshowmode          " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set mouse+=a            " Enable mouse support
set noerrorbells visualbell t_vb= " Disable audible bell because it's annoying.
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set linebreak           " Have lines wrap instead of continue off-screen
set scrolloff=8         " Keep cursor in approximately the middle of the screen
set ttyfast             " Improve redrawing
set cmdheight=2         " Give more space for displaying messages.
set nowrap              " If line just go off the screen it appears on the next line
set shortmess+=I         " Disable the default Vim startup message.

" Having longer udatetime (default os 4000 ms = 4s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" map <C-a> <Nop>
" map <C-x> <Nop>

" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
set incsearch " Enable searching as you type, rather than waiting till you press enter.
set hlsearch  " highlight matches

" turn off search highlight
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp

" UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set undodir=~/.vim/undodir
set undofile
set noswapfile " Don't create swap files.
set nobackup   " Some servers have issues with backup files, see #649.
set nowritebackup

" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <up>    :echoe "use k"<cr>
nnoremap <down>  :echoe "use j"<cr>
" ...and in insert mode
inoremap <left>  <esc>:echoe "use h"<cr>
inoremap <right> <esc>:echoe "use l"<cr>
inoremap <up>    <esc>:echoe "use k"<cr>
inoremap <down>  <esc>:echoe "use j"<cr>

" split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" (shift)tab (de)indents code
nnoremap <tab> >>_
nnoremap <s-tab> <<_

" (shift)tab (de)indents code
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" move highlighted text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" leader
let mapleader=" "

map <C-n> :NERDTreeToggle<CR>

" color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable " turn on syntax highlighting.
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

    let g:gruvbox_material_background = 'soft'
    colorscheme gruvbox-material
endif

" https://github.com/tmux/tmux/issues/1246
" true colors in vim under tmux
" enable true color 启用终端24位色
if exists('+termguicolors')
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:python_highlight_all = 1

" =============================================================================
"   PLUGIN CONFIG
" =============================================================================

" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:lightline = {'colorscheme' : 'gruvbox_material'}

" let g:lightline.component_expand = {
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_infos': 'lightline#ale#infos',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }

" Conquer of Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_custom_config = '1'
" let g:coc_disable_startup_warning = 1
" let g:vista_default_executive = 'coc'

source ~/.vim/coc.vim

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Lightline mods for CoC compatibility
let g:lightline = {
    \ 'colorscheme': 'gruvbox_material',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified', 'fugitive' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileencoding'] ]
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \   'cocstatus': 'coc#status',
    \   'currentfunction': 'CocCurrentFunction'
    \ },
\ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.fzf
set runtimepath^=~/.vim/pack/default/start/fzf.vim

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
