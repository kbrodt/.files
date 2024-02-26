" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" split navigation
" nnoremap <c-j> <c-w><c-j>
" nnoremap <c-k> <c-w><c-k>
" nnoremap <c-l> <c-w><c-l>
" nnoremap <c-h> <c-w><c-h>

" (shift)tab (de)indents code
nnoremap >> >>_
nnoremap << <<_

" (shift)tab (de)indents code
vnoremap >> >gv
vnoremap << <gv

" move highlighted text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" leader
let mapleader=" "

" yank text from cursor till end
nnoremap Y y$

" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap - -<c-g>u
inoremap / /<c-g>u

" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . 'j'

" incriment
noremap <A-x> <C-a>

" buffer
map gn :bn<cr>
map gp :bp<cr>
map gw :bdel<cr>

map <Leader>ee :20Lexplore<cr>

map <Leader>m :make<cr>

" turn off search highlight
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" visual-multi
let g:VM_maps = {}
let g:VM_maps["Exit"] = '<C-C>'   " quit VM

nmap <C-j> <C-Down>
nmap <C-k> <C-Up>

" quickfix
" Show/hide the quickfix window
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cc :cclose<CR>
" Show prev/next error from quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" Show/hide the quickfix window
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>
" Show prev/next item from quickfix
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

if has("nvim")
  augroup quickfix_group
    autocmd!
    autocmd filetype qf setlocal errorformat+=%f\|%l\ col\ %c\|%m
  augroup END
endif

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
