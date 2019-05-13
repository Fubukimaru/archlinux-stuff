let maplocalleader = ","

" Avoid automatic text wrapping.
set textwidth=0
set wrapmargin=0

" activate folding
let g:vimtex_fold_enabled=1

" move correctly in wrapping
noremap <buffer> l gk
noremap <buffer> k gj



" Enable spellcheck 
set spell spelllang=en_gb

" ignore warnings
"
let g:vimtex_quickfix_latexlog = {
    \ 'overfull' : 0,
    \ 'underfull' : 0,
\}
"\ 'packages' : {
"    \   'default' : 0,
"    \ },

