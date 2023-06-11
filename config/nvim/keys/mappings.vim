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

augroup quickfix_group
  autocmd!
  autocmd filetype qf setlocal errorformat+=%f\|%l\ col\ %c\|%m
augroup END

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
