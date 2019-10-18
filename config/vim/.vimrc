set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=start,eol,indent " Fix backspace in ssh

" Set X clipboard as default
set clipboard=unnamedplus

" Size constraints
set textwidth=80
" Break into textwidth
:nnoremap Q gqip

" Set hidden buffers to have buffers without saved content
set hidden

" Local leader as comma and leader as space
let mapleader = "\<Space>"
let maplocalleader = "," 

" Cycling through buffers
:nnoremap gb :bnext<CR>
:nnoremap gB :bprevious<CR>

" cd into file directory

:command Cdf :cd %:p:h

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'jaxbot/github-issues.vim'
" Plugin 'fubukimaru/github-issues.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'

" Themes
" Plugin 'fcpg/vim-orbital'
" Plugin 'scottymoon/vim-twilight'
" Plugin 'dracula/vim'
" Plugin 'chriskempson/base16-vim'

" Tasklist
Plugin 'TaskList.vim'

" R support
Plugin 'jalvesaq/Nvim-R'

" Other interactive languajes
Plugin 'jpalardy/vim-slime'

Plugin 'junegunn/goyo.vim'

Plugin 'vim-scripts/Tabmerge' 

" It's better to use Jupytext
" Plugin 'vyzyv/vimpyter'

Plugin 'lervag/vimtex'

Plugin 'dbeniamine/cheat.sh-vim'

Plugin 'ctrlpvim/ctrlp.vim.git' 

" Python
" Plugin 'vim-python/python-syntax'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'davidhalter/jedi-vim'
Plugin 'python-mode/python-mode'

" Lint
Plugin 'vim-syntastic/syntastic'

" Code doc
Plugin 'kkoomen/vim-doge'

" General autocomplete

"Plugin 'Valloric/YouCompleteMe'

" Plugin 'fs111/pydoc.vim'

" auto close {}()""''
" Plugin 'jiangmiao/auto-pairs'

" vimwiki
Plugin 'vimwiki/vimwiki'
" Markdown/Pandoc
" Plugin 'vim-pandoc/vim-pandoc' 


" buffer close withot closing window
Plugin 'rbgrouleff/bclose.vim'


" CSV 
Plugin 'chrisbra/csv.vim'

" Add ColorSchemes
" Plugin 'flazz/vim-colorschemes'
Plugin 'Fubukimaru/patagonia-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required




" Folding
set foldmethod=indent
"set foldlevel=99



" NERDTree cfg
nmap <F7> :NERDTreeToggle<CR>
"let NERDTreeMapOpenInTab='<ENTER>'


" NERDTree on boot
" :autocmd vimenter * NERDTree

" Move to code when starting with NERDTree
" :au VimEnter * wincmd l

" Tasklist remap 
map <F9> <Plug>TaskList



" Tagbar cfg
nmap <F8> :TagbarToggle<CR>
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

let g:airline_theme='badcat'						" Airline theme


" Tabs
set tabstop=4			" 4 spaces as tab
set softtabstop=4		
set shiftwidth=4
set expandtab			" Tab to space

" ColorSchemes
set t_Co=256			" 256 colors
colorscheme patagonia


"R ctags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ],
    \ "sort" : 0
	\ }

"Markdown
" let g:tagbar_type_markdown = {
"             \ 'ctagstype' : 'markdown',
"             \ 'kinds' : [
"                 \ 'h:headings',
"                 \ 'l:links',
"                 \ 'i:images'
"             \ ],
"     \ "sort" : 0
" \ }


" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
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

"R Markdown
" let g:tagbar_type_rmd = {
"             \ 'ctagstype' : 'rmd',
"             \ 'kinds' : [
"                 \ 'h:headings',
"                 \ 'l:links',
"                 \ 'i:images'
"             \ ],
"     \ "sort" : 0
" \ }

let g:tagbar_type_rmd = {
    \ 'ctagstype': 'rmd',
    \ 'ctagsbin' : 'markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
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



" let g:tagbar_type_vimwiki = {
"            \ 'ctagstype' : 'markdown',
"             \ 'kinds' : [
"                 \ 'h:headings',
"                 \ 'l:links',
"                 \ 'i:images'
"             \ ],
"     \ "sort" : 0
" \ }

let g:tagbar_type_vimwiki = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }



" Remap arrow keys
noremap ; l
noremap ñ l
noremap l k
noremap k j
noremap j h

noremap <C-w>ñ <C-w>l
noremap <C-w>l <C-w>k
noremap <C-w>k <C-w>j
noremap <C-w>j <C-w>h



syntax on

" Seach highlight
set hlsearch


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

" Remove bars '|' on split
:set fillchars+=vert:\  " Change it for space




" Github-issues.vim config
source ~/.gitvimtoken
"let g:github_issues_no_omni = 1
let g:gissues_lazy_load = 1

" NvimR
let R_nvimpager = "vertical" " how to show help 
let R_in_buffer = 0     " R in tmux external terminal 
let R_term = "urxvt" 


"" Open pdf once after knitr
let R_openpdf = 1   
let R_openhtml = 1   

"" highlight chunks
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1

"" Folding
let r_syntax_folding = 1 

"" Disable _ as <-
let R_assign = 0
"inoremap <-- %>%



" Syntax highlighting on non-standard extensions and asm to Microsoft ASM
au BufNewFile,BufRead *.{asm,ASM,GEN,gen,{z,Z}80} set filetype=z80



" Vim slime config
let g_slime_paste_file = "/tmp/.vim-python-pipe"

let g:slime_target = "vimterminal"
let g:slime_default_config = {"sessionname": "vim-slime", "windowname": "0"}
" nmap <LocalLeader>rf :silent !$TERMINAL -e screen -S vim-slime&<CR>
nmap <LocalLeader>rq :SlimeSend1 :q<CR>
"" Disabled by default
" let g:slime_no_mappings = 1
let g:slime_no_mappings=0
vmap <LocalLeader>d <Plug>SlimeRegionSend 
nmap <LocalLeader>c <Plug>SlimeConfig
nmap <LocalLeader>d <Plug>SlimeParagraphSend



" Python Jedi disable on run - Enabled in plugin
let g:jedi#auto_initialization = 0





" VIMTEX
"
let g:vimtex_enable = 0 " Off by default

" VIMWIKI
"
let wiki_1 = {}
let wiki_1.path = '~/Documents/notes/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let g:vimwiki_list = [wiki_1]

let g:vimwiki_folding='expr'

" Global options
"
let g:vimwiki_ext2syntax = {'.md': 'markdown'}

" Language spellcheck
"

:command US setlocal spell spelllang=en_us
:command UK setlocal spell spelllang=en_gb
:command ES setlocal spell spelllang=es_es

" Enable ControlP
set runtimepath^=~/.vim/bundle/ctrlp.vim


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Checkers
"let g:syntastic_r_checkers=['lintr']
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_lintr_linters = "with_defaults()"


let g:syntastic_html_checkers=['eslint']


