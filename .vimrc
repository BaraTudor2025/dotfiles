" ===============================================
" ======= Bara Tudor si firmele lui S.R.L. ======
" ===============================================

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set nocompatible

syntax on
filetype on
set ruler       " Info stanga jos, procente, line si coloana
set nowrap
set guicursor+=a:blinkon0 " Dezactiveaza flicareala
set history=1000 " istoric MARE
set cursorline   " Highligth current line
set nohlsearch   " highlight searched words
set noincsearch  " coloreaza cuvantul in timp real
set guifont=Consolas:h13 " not working in terminal
set title       " change the terminal title
set clipboard+=unnamedplus
set nolist
"set listchars=tab:»·,trail:·
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set nobackup
set noswapfile
set scrolloff=2
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=marker
set laststatus=2
set hidden

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>

" Insert a single character
nmap <leader>i i<esc>r

cmap w!! w !sudo tee % >/dev/null
cmap qq q!

" Buffer menu
nnoremap <leader>b :ls<cr>:b<space>

nnoremap ; :

colorscheme desert

set wildmenu
set wildmode=list:full,full

" Split this window
nnoremap <leader>v <C-w>v<C-w>l

imap jk <esc>`^

" Faster navigation
map J 5j
map K 5k
map H ^
map L $

" Split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Align text blocks and keep them highlighted
vmap < <gv
vmap > >gv
nmap < <<
nmap > >>

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>

" Edits wraped lines
noremap j gj
noremap k gk
noremap 0 g0
noremap ^ g^
noremap $ g$

set number relativenumber
augroup relative_num
    autocmd! InsertEnter * set norelativenumber
    autocmd! InsertLeave * set relativenumber
augroup END

augroup buf_enter
    autocmd!
    autocmd BufRead * call ReadOnlyKeys()
    autocmd BufReadPost * call CursorPos()
    autocmd BufRead * :normal zz
augroup END


function! ReadOnlyKeys()
    if &readonly
        noremap <buffer><nowait>d <c-d>
        noremap <buffer>u <c-u>
        noremap <buffer>f <c-f>
        noremap <buffer>b <c-b>
        noremap <buffer>h K
        noremap <buffer>t <c-]> "follow tag
    endif
endfunction

fun! CursorPos()
    if line("'\"") > 0 && line ("'\"") <= line ('$')
        execute "normal! g'\""
    endif
endfun

