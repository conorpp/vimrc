
" A package manager for vim
set nocompatible
call pathogen#infect()

filetype off
syntax on
filetype plugin indent on

set tabstop=4           " tabs are 4 spaces
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smartindent
set showmatch
set ruler
set backspace=indent,eol,start
set encoding=utf-8

exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list
set mouse=a  " Set mouse highlighting
set nu       " Set line numbers

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" spell check for markdown and latex files 
au BufRead *.md setlocal spell spelllang=en_us
au BufRead *.tex setlocal spell spelllang=en_us
"au BufRead *.tex setlocal spell spelllang=en_us

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'

" Set Leader Key
let mapleader = "\<Space>"

" Insert Headings
function FileHeading()
    let s:line=line(".")
    call setline(s:line, "/*")
    call append(s:line,  "  Name: Conor Patrick")
    call append(s:line+2,"  Email: conorpp@vt.edu")
    call append(s:line+3,"  Class: ECE 3574")
    call append(s:line+4,"  Date: ".strftime("%b %d %Y"))
    call append(s:line+5,"  Assignment: HW")
    call append(s:line+6,"  Source File: ".expand('%'))
    call append(s:line+7,"*/")
    unlet s:line
endfunction
function FunctionHeading()
    let s:line=line(".")
    call append(s:line,"//Action: ")
    call append(s:line+1,"//Parameters:")
    call append(s:line+2,"//  IN:  ")
    call append(s:line+3,"//  OUT: None    ")
    call append(s:line+4,"//Returns: ")
    call append(s:line+5,"//Considerations: ")
    unlet s:line
endfunction

map <leader>F mz:execute FunctionHeading()<CR>`zjA
map <leader>f mz:execute FileHeading()<CR>`z4kA

" Window movement
function! WinMove(key) 
    let t:curwin = winnr() 
    exec "wincmd ".a:key 
    if (t:curwin == winnr()) "we havent moved
        if (match(a:key,'[jk]')) "were we going up/down
            wincmd v
        else 
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" Exit insert mode by pressing jj
inoremap jj <ESC>
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

" Resize windows with arrow keys
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

" Copy,cut,paste using system clipboard
" e.g. <leader>yy
map <leader>y              "+y
map <leader>d              "*d
map <leader>p              "*p

" latex
map <leader>x              :! pdflatex $PAPER<CR><CR>


" file binding for using tabs in makefiles
autocmd FileType make setlocal noexpandtab

set t_Co=256
colorscheme distinguished
syntax enable
let g:solarized_termcolors=256

" tab functionality
nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>

nnoremap <S-Right> :tabe %<CR>
nnoremap <S-Left> :tabe %<CR>

nnoremap <A-S-Left> :tabm -1<CR>
nnoremap <A-S-Right> :tabm +1<CR>

