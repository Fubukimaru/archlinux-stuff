let maplocalleader = ","

let g:slime_no_mappings=0
vmap <LocalLeader>d <Plug>SlimeRegionSend 
nmap <LocalLeader>c <Plug>SlimeConfig
nmap <LocalLeader>d <Plug>SlimeParagraphSend

" Open/Close screen ipython
nmap <LocalLeader>rf :silent !$TERMINAL -e screen -S vim-slime-python ipython3 --matplotlib tk &<CR>
nmap <LocalLeader>rq :SlimeSend1 quit()<CR>


let g:slime_preserve_curpos = 0

let g:slime_default_config = {"sessionname": "vim-slime-python", "windowname": "0"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1 "Special paste?
