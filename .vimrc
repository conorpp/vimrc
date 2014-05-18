set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
syntax on
set autoindent
set smartindent
set showmatch
set ruler
set backspace=indent,eol,start
highlight ColorColumn ctermbg=17
set colorcolumn=81
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list

" Set Leader Key
let mapleader = ","

" Insert Headings
function FileHeading()
    let s:line=line(".")
    call setline(s:line,"//Name: Sean Kelley")
    call append(s:line,"//Date: ".strftime("%b %d %Y"))
    call append(s:line+1,"//Assignment: ")
    call append(s:line+2,"//Source File: ".expand('%'))
    call append(s:line+3,"//Action: ")
    call append(s:line+4,"//Class: C243 (TTh 09:30-11:20)")
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

map <leader>f mz:execute FunctionHeading()<CR>`zjA
map <leader>F mz:execute FileHeading()<CR>`z4kA

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

map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

map <leader>wc :wincmd q<cr>
map <leader>wr <C-W>r

map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>
" for color
set t_Co=256

" Plugins "

nnoremap <C-n> :NERDTreeToggle<cr>

""""""""""
" Vundle "
""""""""""
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
" :BundleInstall  to install
" :BundleClean    to remove unused
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
" autocomplete
" Bundle 'Valloric/YouCompleteMe'
"" YouCompleteMe Specific things "
" let g:clang_complete_auto = 1
" let g:clang_use_library = 1
" let g:clang_debug = 1
" let g:clang_library_path = '/usr/local/lib/'
" let g:clang_user_options='|| exit 0'
"
" Warnings/errors
Bundle 'scrooloose/syntastic'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


colorscheme tropikos
