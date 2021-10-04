let g:lightline = {
   \ 'colorscheme': 'gruvbox_material',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'currentfunction', 'readonly', 'filename', 'modified', 'fugitive' ] ],
   \   'right': [ [ 'lineinfo' ],
   \              [ 'percent' ],
   \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileencoding'] ]
   \ },
   \ 'component_function': {
   \   'filename': 'LightlineFilename',
   \ },
\ }

function! LightlineFilename()
 return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use autocmd to force lightline update.
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Lightline mods for CoC compatibility
" let g:lightline = {
"     \ 'colorscheme': 'gruvbox_material',
"     \ 'active': {
"     \   'left': [ [ 'mode', 'paste' ],
"     \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified', 'fugitive' ] ],
"     \             [ 'currentfunction', 'readonly', 'filename', 'modified', 'fugitive' ] ],
"     \   'right': [ [ 'lineinfo' ],
"     \              [ 'percent' ],
"     \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileencoding'] ]
"     \ },
"     \ 'component_function': {
"     \   'filename': 'LightlineFilename',
"     \   'cocstatus': 'coc#status',
"     \   'currentfunction': 'CocCurrentFunction'
"     \ },
" \ }
" 
" function! LightlineFilename()
"   return expand('%:t') !=# '' ? @% : '[No Name]'
" endfunction
" 
" function! CocCurrentFunction()
"     return get(b:, 'coc_current_function', '')
" endfunction
