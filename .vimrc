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
"highlight ColorColumn ctermbg=17
"set colorcolumn=81
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list
set mouse=a  " Set mouse highlighting
set nu       " Set line numbers
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Set Leader Key
let mapleader = ","

" Insert Headings
function FileHeading()
    let s:line=line(".")
    call setline(s:line,"/*")
    call append(s:line,"  Name: Conor Patrick")
    call append(s:line+1,"  PID#: 905700607")
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
map <F2> <Esc>
imap <F2> <Esc>
map <F3> v
imap <F3> <Esc>v
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>
" for color

" file binding for using tabs in makefiles
autocmd FileType make setlocal noexpandtab

set t_Co=256
colorscheme distinguished
syntax enable
let g:solarized_termcolors=256
