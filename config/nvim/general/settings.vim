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

autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" UI config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable " turn on syntax highlighting.
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
set shortmess+=I        " Disable the default Vim startup message.
set encoding=utf-8      " The encoding displayed
set fileencoding=utf-8  " The encoding written to file
set ruler               "  Show the cursor position all the time
set signcolumn=yes      "  Always show the signcolumn, otherwise it would shift the text each time
set clipboard=unnamedplus " Copy paste between vim and everything else
set t_Co=256            " Support 256 colors
set clipboard+=unnamed,unnamedplus

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

map <C-a> <Nop>  " Unbind for tmux
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
