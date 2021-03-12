if exists("b:current_compiler") | finish | endif
let b:current_compiler = "mdlz80optimizer"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

"CompilerSet makeprg=java\ -jar\ ~/bin/mdl.jar\ -dialect\ asmsx-zilog\ -po\ $*
CompilerSet makeprg=java\ -jar\ ~/bin/mdl.jar\ -dialect\ asmsx\ -po\ $*
CompilerSet errorformat=INFO:\ Pattern-based\ optimization\ in\ %f#%l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
