if exists("current_compiler")
    finish
endif
let current_compiler = "r"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=Rscript\ -e\ \'library(rmarkdown);\ render(\"%\",\ output_format=\"pdf_document\")\'
CompilerSet errorformat=%EQuitting\ from\ lines\ %l\-%.%#\ (%f)
CompilerSet errorformat+=%C%m
CompilerSet errorformat+=%C%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
