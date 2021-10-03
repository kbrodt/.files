" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

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
map gp :bn<cr>
map gq :bdel<cr>
