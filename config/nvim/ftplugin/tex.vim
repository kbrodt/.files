if !exists("current_compiler")
    compiler tex
endif

let g:vimtex_fold_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_method = 'zathura'

" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]

let maplocalleader = " "

nmap dsm <Plug>(vimtex-env-delete-math)
nmap csm <Plug>(vimtex-env-change-math)
nmap tsm <Plug>(vimtex-env-toggle-math)

" Use `ai` and `ii` for the item text object
omap ai <Plug>(vimtex-am)
xmap ai <Plug>(vimtex-am)
omap ii <Plug>(vimtex-im)
xmap ii <Plug>(vimtex-im)

" Use `am` and `im` for the inline math text object
omap am <Plug>(vimtex-a$)
xmap am <Plug>(vimtex-a$)
omap im <Plug>(vimtex-i$)
xmap im <Plug>(vimtex-i$)
