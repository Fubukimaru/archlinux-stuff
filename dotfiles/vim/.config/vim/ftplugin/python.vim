let maplocalleader = ","

" Disable python mode syntax check
let g:pymode_lint_on_write = 0

" Break line at 79 cols PEP8
set textwidth=79

" Open/Close screen ipython
nmap <LocalLeader>rf :!$TERMINAL -e screen -S vim-slime-python ipython3 --matplotlib tk &<CR>
nmap <LocalLeader>rq :SlimeSend1 quit()<CR>

let g:slime_target = "screen"
let g:slime_preserve_curpos = 0

let g:slime_default_config = {"sessionname": "vim-slime-python", "windowname": "0"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1 "Special paste?


" Mapping
nmap <LocalLeader>rq :SlimeSend1 :q<CR>
vmap <LocalLeader>d <Plug>SlimeRegionSend 
nmap <LocalLeader>c <Plug>SlimeConfig
nmap <LocalLeader>d <Plug>SlimeParagraphSend




" Python syntax highlight
let g:python_highlight_all = 1


" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1

" python_mode

let g:pymode_python = 'python3'