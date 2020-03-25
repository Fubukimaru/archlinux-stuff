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


" Remap bufferdelete to Bclose
:nnoremap bd :Bclose<CR>

" cd into file directory

:command Cdf :cd %:p:h

" fzf history control + p
:noremap <C-P> :History<CR>


" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'jaxbot/github-issues.vim'
" Plug 'fubukimaru/github-issues.vim'

Plug 'scrooloose/nerdtree'

Plug 'majutsushi/tagbar'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'

" Themes
" Plug 'fcpg/vim-orbital'
" Plug 'scottymoon/vim-twilight'
" Plug 'dracula/vim'
" Plug 'chriskempson/base16-vim'

" Dictionary

Plug 'vim-scripts/vim-dict'

" Tasklist
Plug 'vim-scripts/TaskList.vim'

" R support
Plug 'jalvesaq/Nvim-R'

" Other interactive languajes
Plug 'jpalardy/vim-slime'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'

Plug 'vim-scripts/Tabmerge' 

Plug 'lervag/vimtex'

Plug 'dbeniamine/cheat.sh-vim'

" Install fzf (optional)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" fzf plugin
Plug 'junegunn/fzf.vim' 

" Python
" Plug 'vim-python/python-syntax'
" Plug 'tmhedberg/SimpylFold'
Plug 'davidhalter/jedi-vim'
Plug 'python-mode/python-mode'

" Lint
" Plug 'vim-syntastic/syntastic'

" Code doc
Plug 'kkoomen/vim-doge'

" vimwiki
Plug 'vimwiki/vimwiki'
" Markdown/Pandoc
Plug 'vim-pandoc/vim-pandoc' 
Plug 'vim-pandoc/vim-pandoc-syntax'


" buffer close withot closing window
Plug 'rbgrouleff/bclose.vim'


" CSV 
Plug 'chrisbra/csv.vim'

" Markdown Tables
Plug 'dhruvasagar/vim-table-mode'

" Add ColorSchemes
" Plug 'flazz/vim-colorschemes'
Plug 'Fubukimaru/patagonia-vim'

" COC Completion + linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" Folding
set foldmethod=indent
"set foldlevel=99



" NERDTree cfg
nmap <F7> :NERDTreeToggle<CR>
"nmap <F7> :Lexplore<CR>
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


let g:airline_theme='deus'						" Airline theme


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

let g:tagbar_type_markdown = {
            \ 'ctagsbin'  : 'mdctags',
            \ 'ctagsargs' : '',
            \ 'kinds'     : [
            \     'a:h1:0:0',
            \     'b:h2:0:0',
            \     'c:h3:0:0',
            \     'd:h4:0:0',
            \     'e:h5:0:0',
            \     'f:h6:0:0',
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \     'a' : 'h1',
            \     'b' : 'h2',
            \     'c' : 'h3',
            \     'd' : 'h4',
            \     'e' : 'h5',
            \     'f' : 'h6',
            \ },
            \ 'scope2kind' : {
            \     'h1' : 'a',
            \     'h2' : 'b',
            \     'h3' : 'c',
            \     'h4' : 'd',
            \     'h5' : 'e',
            \     'h6' : 'f',
            \}
            \}

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

" Remap arrow keys
source ~/.vim/mappings

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
let wiki_1.path_html = '~/Documents/notes_html'
let wiki_1.template_path = '~/.vim/vimwiki/'
let wiki_1.template_default = 'markdown'
let wiki_1.template_ext = '.html'
let wiki_1.custom_wiki2html = 'wiki2html.sh'

let wiki_bsc = {}
let wiki_bsc.path = '~/Documents/notes/bsc'
let wiki_bsc.syntax = 'markdown'
let wiki_bsc.ext = '.md'
let wiki_bsc.path_html = '~/Documents/notes_html/bsc'
let wiki_bsc.template_path = '~/.vim/vimwiki/'
let wiki_bsc.template_default = 'markdown'
let wiki_bsc.template_ext = '.html'
let wiki_bsc.custom_wiki2html = 'wiki2html.sh'



let g:vimwiki_list = [wiki_1, wiki_bsc]

let g:vimwiki_folding='expr'

" Global options
"
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:pandoc#keyboard#display_motions = 0
let g:pandoc#syntax#conceal#urls = 1
au FileType vimwiki set syntax=pandoc

" Language spellcheck
"

:command US setlocal spell spelllang=en_us
:command UK setlocal spell spelllang=en_gb
:command ES setlocal spell spelllang=es_es
:command CA setlocal spell spelllang=ca_es


" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" 
" " Checkers
" "let g:syntastic_r_checkers=['lintr']
" let g:syntastic_enable_r_lintr_checker = 1
" let g:syntastic_r_lintr_linters = "with_defaults()"
" 
" 
" let g:syntastic_html_checkers=['eslint']

"netrw

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Coc
source ~/.vim/cocrc


" Vimdiff
set diffopt+=iwhite

if &diff
    " set cursorline
    map ł ]c
    map ð [c
    "hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    "hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    "hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

" Easy align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
