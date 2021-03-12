set tabstop=2			" 4 spaces as tab
set softtabstop=2		
set shiftwidth=2

let g:syntastic_javascript_checkers=['eslint']

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }

