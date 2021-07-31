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
" nnoremap J mzJ`z

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
