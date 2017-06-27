" ===============================================
" ======= Bara Tudor si firmele lui S.R.L. ======
" ===============================================

" 'zo' - deschie un fold
" 'zc' - inchide un fold
" 'zM' - inchide toate foldurile
" 'zR' - deschide toate foldurile
" foldurile sunt delimitate de 3 din astea {  }


" Plugins {{{
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set nocompatible
let g:mapleader = "\<space>"

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd! VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_powerline_fonts = 1

Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'
let g:NERDTreeWinSize = 25

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" }}}


" Setari generale {{{
syntax on
filetype on
set path+=**
set ruler       " Info stanga jos, procente, line si coloana
set cursorline
set noshowmode
set nowrap
set guicursor+=a:blinkon0 " Dezactiveaza flicareala
set history=1000 " istoric MARE
set nocursorline   " Highligth current line
set nohlsearch   " highlight searched words
set noincsearch  " coloreaza cuvantul in timp real
" set guifont="Monospace Regular":h13

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
set autochdir

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set wildmenu
set gdefault
set ignorecase
set smartcase
set wildmode=longest:full,full

" colorscheme desert
set termguicolors
set background=dark
colo gruvbox

highlight! link Visual Folded
" highlight! link IncSearch DiffChange
" highlight! link Search DiffChange

" }}}


" Comenzi {{{

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>

" Insert a single character
nmap <leader>i i<esc>r

command! SudoW :w !sudo tee % >/dev/null
cmap w!! w !sudo tee % >/dev/null
cmap qq qa!

" Ex mode navigation
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-w> <c-right>
cnoremap <c-b> <c-left>
cnoremap <c-j> <left>
cnoremap <c-k> <right>

" Use tab to go to previous buffer
nnoremap <tab> <c-^>

" Buffer menu
nnoremap <leader>b :ls<cr>:b<space>

nnoremap ; :

imap jk <esc>`^
imap jj <esc>`^

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
xmap < <gv
xmap > >gv
nmap < <<
nmap > >>

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>
inoremap <c-o> <esc>o

" Unimpaired
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>
nnoremap [b :bnext<cr>
nnoremap ]b :bprev<cr>
nnoremap [t :tabnext<cr>
nnoremap ]t :tabprev<cr>

" Edits wraped lines
noremap j gj
noremap k gk
noremap 0 g0
noremap ^ g^
noremap $ g$

" Toggle search highlight
let g:hlstate=0
nnoremap <leader>h :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" }}}


" Autocomenzi {{{
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

augroup CursorLineOnlyInActiveWindow
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Mark the last editerd file
augroup buf_leave
    autocmd!
    autocmd BufLeave *.cpp  normal! mC
    autocmd BufLeave *.h    normal! mH
    autocmd BufLeave *.vim  normal! mV
    autocmd BufLeave *.py   normal! mP
    autocmd BufLeave *.hpp  normal! mH
    autocmd BufLeave *.hs   normal! mL
augroup END

fun! CursorPos()
    if line("'\"") > 0 && line ("'\"") <= line ('$')
        execute "normal! g'\""
    endif
endfun
" }}}

