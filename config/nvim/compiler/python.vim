if exists("current_compiler")
    finish
endif
let current_compiler = "python"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=python3\ %
CompilerSet errorformat=
      \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
      \%*\\sFile\ \"%f\"\\,\ line\ %l,

let &cpo = s:cpo_save
unlet s:cpo_save
