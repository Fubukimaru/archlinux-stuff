let maplocalleader = ","

let g:vimtex_enable = 1 " On by default
let g:tex_flavor = 'latex' " Avoid vim using filetype 'plaintex'
let g:vimtex_view_method = 'zathura'



" Not open the error window automatically. DANGER!
" let g:vimtex_quickfix_mode 0

" Disable auto opening quickfix on warning. Only on error
let g:vimtex_quickfix_open_on_warning = 0


" Avoid automatic text wrapping.
set textwidth=0
set wrapmargin=0

" activate folding
let g:vimtex_fold_enabled=1

" activate latex objects
let g:vimtex_text_obj_enabled=1


nmap <F8> :VimtexTocToggle<CR>


" move correctly in wrapping
noremap <buffer> l gk
noremap <buffer> k gj



" Enable spellcheck 
set spell spelllang=en_us
"set spell spelllang=en_gb

" Mappings
inoremap ;beg \begin{}<Enter>(<>)<Enter>\end{}<Enter>
inoremap ;tab \begin{table}<Enter>(<>)<Enter>\end{table}<Enter>
inoremap ;fig \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[width=\linewidth]{(<>)}<Enter>\caption{(<>)}<Enter>\label{(<>)}<Enter>\end{figure}<Enter>

"inorema <tab> /\(<>\)<Enter>
