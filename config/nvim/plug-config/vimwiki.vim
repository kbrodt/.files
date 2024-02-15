let g:vimwiki_folding = 'list'

let g:vimwiki_list = [
\   {
\     'path': '~/vimwiki/',
\     'links_space_char': '_',
\     'css_name': 'stylesheet.css'
\   },
\   {
\     'path': '~/edu/aimasters-23/',
\     'template_path': '~/edu/aimasters-23/',
\     'template_default': 'default',
\     'template_ext': '.tpl',
\     'links_space_char': '_',
\   }
\ ]


let g:taskwiki_disable_concealcursor = 'yes'

autocmd FileType vimwiki inoremap <F5> <Esc>:VimwikiAll2HTML<Enter>
autocmd FileType vimwiki nnoremap <F5> :VimwikiAll2HTML<Enter>
