"set filetype=pandoc



function PataTask()
    let $VIM_PATA_TASK = strpart(split(getline('.'))[-1], 1)
    term ++rows=8 vimpata
endfunction

nnoremap <LocalLeader>ts :call PataTask()<CR>
