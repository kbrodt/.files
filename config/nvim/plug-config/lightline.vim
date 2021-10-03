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
