" Environment (Use XDG Directories)
    set directory=$XDG_CACHE_HOME/vim,~/,/tmp
    set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
    set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
    set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
    let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
    let $VIM_DIR="$XDG_CONFIG_HOME/vim"

" Force python3
    if has('python3')
    endif

" Mandatory and general
    set nocompatible                " be iMproved, required
    filetype off                    " required
    set backspace=start,eol,indent  " Fix backspace in ssh
    syntax on
    set foldmethod=indent
    set foldlevel=1                 " Only first fold open
    set hlsearch " Seach highlight

" Set X clipboard as default
    set clipboard=unnamedplus

" Remap arrow keys
    source $VIM_DIR/mappings

" Size constraints
    set textwidth=80
" Set hidden buffers to have buffers without saved content
    set hidden

" Vimdiff
    set diffopt+=iwhite

" Local leader as comma and leader as space
    let mapleader = "\<Space>"
    let maplocalleader = "," 

" vim-plug
    " call plug#begin('$VIM_DIR/plugged')
    call plug#begin('~/.config/vim/plugged')
        Plug 'tpope/vim-fugitive'

        Plug 'jaxbot/github-issues.vim'
        " Plug 'fubukimaru/github-issues.vim'

        Plug 'scrooloose/nerdtree'

        Plug 'majutsushi/tagbar'

        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'enricobacis/vim-airline-clock'

        " Dictionary

        Plug 'vim-scripts/vim-dict'

        " Tasklist
        Plug 'vim-scripts/TaskList.vim'

        " R support
        Plug 'jalvesaq/Nvim-R', { 'for': 'r' }

        " Other interactive languajes
        Plug 'jpalardy/vim-slime', { 'for': 'python' }

        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/vim-easy-align'

        "Plug 'vim-scripts/Tabmerge' 

        Plug 'lervag/vimtex', { 'for': [ 'tex', 'plaintex' ] }

        Plug 'dbeniamine/cheat.sh-vim'

        " Install fzf (optional)
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        " fzf plugin
        Plug 'junegunn/fzf.vim' 

        " Code doc
        Plug 'kkoomen/vim-doge'

        " vimwiki
        Plug 'vimwiki/vimwiki'
        " Markdown/Pandoc
        Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'vimwiki', 'pandoc', 'markdown' ] }
        Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'vimwiki', 'pandoc', 'markdown' ] } 


        " buffer close withot closing window
        Plug 'rbgrouleff/bclose.vim'


        " CSV 
        Plug 'chrisbra/csv.vim', { 'for': 'csv' }

        " Markdown Tables
        Plug 'dhruvasagar/vim-table-mode'

        " Add ColorSchemes
        " Plug 'flazz/vim-colorschemes'
        Plug 'Fubukimaru/patagonia-vim'

        " COC Completion + linting
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " Task
        Plug 'tbabej/taskwiki', { 'for': [ 'vimwiki', 'pandoc', 'markdown' ] }
        Plug 'farseer90718/vim-taskwarrior', { 'for': [ 'vimwiki', 'pandoc', 'markdown' ] }
        Plug 'powerman/vim-plugin-AnsiEsc'

        "AsyncRun
        "Plug 'skywind3000/asyncrun.vim'
        Plug 'tpope/vim-dispatch'
    call plug#end()

" Tagbar cfg
    " autocmd VimEnter * Tagbar   " TagBar on boot
    let g:tagbar_left = 1       " TagBar on left
    let g:tagbar_width = 25     " Tagbar width

    au VimEnter * wincmd l

" UI Settings
    :set colorcolumn=80		" Line at 80 columns
    :set number relativenumber     " Hybrid line numbers

    " Base16 theme
    let base16colorspace=256

    " VIM airline
    let g:airline#extensions#tabline#enabled = 1		" Smart tab line
    let g:airline#extensions#clock#format = '%H:%M:%S'	" Airline clock
    let g:airline#extensions#clock#updatetime = 5000	" Update clock each 5 sec
    let g:airline_powerline_fonts = 1					" Use powerline fonts


    let g:airline_theme='deus'						" Airline theme
    " Tabs
    set tabstop=4			" 4 spaces as tab
    set softtabstop=4		
    set shiftwidth=4
    set expandtab			" Tab to space

    " ColorSchemes
    set t_Co=256			" 256 colors
    colorscheme patagonia
    :set fillchars+=vert:\  " Remove bars '|' on split (puts space)

"Tagbar types
    let g:tagbar_type_r = {
        \ 'ctagstype' : 'r',
        \ 'kinds'     : [
            \ 'f:Functions',
            \ 'g:GlobalVariables',
            \ 'v:FunctionVariables',
        \ ],
        \ "sort" : 0
    \ }

    " Add support for markdown files in tagbar.
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : 'markdown2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes --sro="|"',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }

    let g:tagbar_type_rmd = {
        \ 'ctagstype': 'rmd',
        \ 'ctagsbin' : 'markdown2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes --sro="|"',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }


    let g:tagbar_type_vimwiki = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : 'markdown2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes --sro="|"',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }

    let g:tagbar_type_pandoc = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : 'markdown2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes --sro="|"',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }

    let g:tagbar_type_javascript = {
        \ 'ctagstype' : 'JavaScript',
        \ 'kinds'     : [
            \ 'o:objects',
            \ 'f:functions',
            \ 'a:arrays',
            \ 's:strings'
        \ ]
    \ }


" Goyo enter function
    function! s:goyo_enter()
        " Goyo virtual up and down instead of line up and down
        " local remap
        noremap <buffer> l gk
        noremap <buffer> k gj

        ":q quits vim
        let b:quitting = 0
        let b:quitting_bang = 0
        autocmd QuitPre <buffer> let b:quitting = 1
        cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    endfunction

    function! s:goyo_leave()
        "local up down restore
        noremap <buffer> l k
        noremap <buffer> k j
      " Quit Vim if this is the only remaining buffer
        if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
            if b:quitting_bang
                qa!
            else
                qa
            endif
        endif
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave call <SID>goyo_leave()

" Github-issues.vim config
    source ~/.gitvimtoken
    let g:gissues_lazy_load = 1

" Syntax highlighting on non-standard extensions and asm to Microsoft ASM
    au BufNewFile,BufRead *.{asm,ASM,GEN,gen,{z,Z}80} set filetype=z80

" Vim slime config
    let g_slime_paste_file = "/tmp/.vim-python-pipe"

    let g:slime_target = "vimterminal"
    let g:slime_default_config = {"sessionname": "vim-slime", "windowname": "0"}
    "" Disabled by default
    let g:slime_no_mappings=0

" VIMWIKI
    let wiki_1 = {}
    let wiki_1.path = '~/Documents/notes/'
    let wiki_1.syntax = 'markdown'
    let wiki_1.ext = '.md'
    let wiki_1.path_html = '~/Documents/notes_html'
    let wiki_1.template_path = '$VIM_DIR/vimwiki/'
    let wiki_1.template_default = 'markdown'
    let wiki_1.template_ext = '.html'
    let wiki_1.custom_wiki2html = 'wiki2html.sh'

    let g:vimwiki_list = [wiki_1]

    let g:vimwiki_folding='custom'
    " Disable vimwiki in external markdown files
    " let g:vimwiki_global_ext= 0

" Pandoc
    let g:pandoc#keyboard#display_motions = 0
    let g:pandoc#syntax#conceal#urls = 1

    let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
    let g:pandoc#folding#mode = 'syntax'
    let g:pandoc#modules#enabled = ["folding", "command"] 

" TASKWIKI
    let g:taskwiki_disable_concealcursor = 1
    let g:taskwiki_markup_syntax = "markdown"
    let g:taskwiki_sort_order = "status-,due+,end+,pri-,project+"

" Language spellcheck
    :command US setlocal spell spelllang=en_us
    :command UK setlocal spell spelllang=en_gb
    :command ES setlocal spell spelllang=es_es
    :command CA setlocal spell spelllang=ca_es

" Coc
    source $VIM_DIR/cocrc

" vimtex
let g:tex_flavor = 'latex'
