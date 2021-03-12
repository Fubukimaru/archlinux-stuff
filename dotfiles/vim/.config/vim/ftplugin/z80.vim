" Setting the error format to asMSX
set errorformat=%f\\,\ line\ %l:\ %m

"autocmd FileType z80 compiler mdlz80optimizer

"au BufWritePost * make %

":nnoremap <F5> :compiler asmsx \| :make % \| :cwindow <CR>
":nnoremap <F6> :compiler mdlz80optimizer \| :make % \| :cwindow <CR>

" With AsyncRun
" Set -> let g:asyncrun_open = 10
:nnoremap <F5> :compiler asmsx \| :Make %<CR>
:nnoremap <F6> :compiler mdlz80optimizer \| :Make %<CR>


