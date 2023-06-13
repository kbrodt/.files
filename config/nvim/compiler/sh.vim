if exists("current_compiler")
    finish
endif
let current_compiler = "sh"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=sh\ %
CompilerSet errorformat=%f:\ line\ %l:\ %m

" c
CompilerSet errorformat+=
      \%*[^\"]\"%f\"%*\\D%l:%c:\ %m,
      \%*[^\"]\"%f\"%*\\D%l:\ %m,
      \\"%f\"%*\\D%l:%c:\ %m,
      \\"%f\"%*\\D%l:\ %m,
      \%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,
      \%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.),
      \%f:%l:%c:\ %trror:\ %m,
      \%f:%l:%c:\ %tarning:\ %m,
      \%f:%l:%c:\ %m,
      \%f:%l:\ %trror:\ %m,
      \%f:%l:\ %tarning:\ %m,
      \%f:%l:\ %m,
      \%f:\\(%*[^\\)]\\):\ %m,
      \\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ %*[`']%f',
      \%D%*\\a:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a:\ Leaving\ directory\ %*[`']%f',
      \%DMaking\ %*\\a\ in\ %f

" python
CompilerSet errorformat+=
      \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
      \%*\\sFile\ \"%f\"\\,\ line\ %l,

let &cpo = s:cpo_save
unlet s:cpo_save
