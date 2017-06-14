
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
setlocal foldmethod=marker
set laststatus=2

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>

" Insert a single character
nmap <leader>i i<esc>r

cmap w!! w !sudo tee % >/dev/null
cmap qq q!

nnoremap ; :

imap jk <esc>`^

" Split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>

" Edits wraped lines
noremap j gj
noremap k gk
noremap <silent> 0 g0
noremap <silent> ^ g^
noremap <silent> $ g$

set number relativenumber
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" Split this window
nnoremap <leader>v <C-w>v<C-w>l

" Faster navigation
map J 5j
map K 5k
map H ^
map L $


autocmd! BufWrite $MYVIMRC source $MYVIMRC

