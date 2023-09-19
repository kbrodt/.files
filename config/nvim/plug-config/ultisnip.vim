let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'

let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']          " using Vim
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']  " using Neovim

" Use <leader>u in normal mode to refresh UltiSnips snippets
nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>
