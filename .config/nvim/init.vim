" Bara Tudor si firmele lui S.R.L

"  git config --global credential.helper 'cache --timeout=86.400'

" Vim-Plug {{{
set nocompatible

" install vim-plug on new machine
if empty(glob('~/.config/nvim/plugged'))
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.config/nvim/plugged")

" GitHub integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iCyMind/NeoSolarized'
"Plug 'yuttie/comfortable-motion.vim'
"Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/ZoomWin'
Plug 'mhinz/vim-startify'

" Navigation
Plug 'scrooloose/nerdtree' , { 'do' : 'NERDTreeCWD' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'brooth/far.vim'

" Edit
"Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-abolish'
"Plug 'godlygeek/tabular'

" Syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight' , { 'for' : 'cpp' }
Plug 'mizuchi/stl-syntax' , { 'for' : 'cpp' }
Plug 'Shougo/neco-vim'

" Auto comletion and Engines
Plug 'Shougo/deoplete.nvim' , { 'do' : ':UpdateRemotePlugins' }
Plug 'sirver/ultisnips'
Plug 'neomake/neomake'

" C++ plugins
Plug 'Shougo/neoinclude.vim' , { 'for' : 'cpp' }
Plug 'zchee/deoplete-clang' , { 'for' : 'cpp' }
Plug 'rhysd/vim-clang-format', { 'for' : 'cpp' }

" Use '[' and ']' with stuff
Plug 'tpope/vim-unimpaired'

" Disable hjkl and ohther useless shit
Plug 'takac/vim-hardtime'

" Removes trailing spaces
Plug 'thirtythreeforty/lessspace.vim'

" Google inside vim
Plug 'szw/vim-g'

" Vim session manager
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" Reload scripts manually
Plug 'xolox/vim-reload'

" Terminal airline
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'


call plug#end()

" }}}


" General settings {{{

syntax on       " Vim detecteaza automat limjaul folosit
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

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set number relativenumber
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" }}}


" Mappings {{{

" Make leader space
let mapleader="\<space>"

" Install Plugs
nmap <silent> <leader>ip :PlugInstall<cr>
nmap <silent> <leader>up :PlugUpdate<cr>

" Go fullscreen
nmap <silent> <leader>z :ZoomWin<cr>

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>

" Open nerd tree with ctrl-n
nmap <silent> <leader>n :NERDTreeCWD<cr>
let g:NERDTreeWinSize = 25

" Split this window
nnoremap <leader>v <C-w>v<C-w>l

" New line
imap <s-cr> <esc>oi

" Better ESC
inoremap jk <Esc>`^

" Easy column
nnoremap ; :

" Insert a single character
nmap <leader>i i<esc>r

" Insert semicolomn at end of line
inoremap ;; <esc>A;

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>

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

" Edits wraped lines
noremap j gj
noremap k gk
noremap <silent> 0 g0
noremap <silent> ^ g^
noremap <silent> $ g$

" Easy motion mappings

nmap s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-bd-f)

nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>w <Plug>(easymotion-bd-w)

nmap <Leader>L <Plug>(easymotion-overwin-line)

map <Leader>l <Plug>(easymotion-lineanywhere)
vmap <Leader>l <Plug>(easymotion-lineanywhere)

map f <Plug>(easymotion-sl)

map t <Plug>(easymotion-bd-tl)

let g:EasyMotion_smartcase = 1
"
" }}}


" Colorscheme settings {{{

set termguicolors
set background=dark
colorscheme NeoSolarized
highlight Visual cterm=bold ctermfg=12 ctermbg=0 gui=bold guifg=#839496 guibg=#073642 guisp=#002b36
highlight IncSearch cterm=bold ctermfg=3 ctermbg=0 gui=bold guifg=#b58900 guibg=#073642 guisp=#b58900
highlight Search cterm=bold ctermfg=3 ctermbg=0 gui=bold guifg=#b58900 guibg=#073642 guisp=#b58900

"set t_Co=256
"let g:solarized_termcolors=256
"let g:rainbow#max_level = 16
"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

exec 'source' '~/.config/nvim/plugged/vim-easymotion/autoload/EasyMotion/highlight.vim'

" }}}


" Airline {{{

" installation commands

"git clone https://github.com/powerline/fonts.git
"cd fonts
"./install.sh
"cd ..
"rm -rf fonts

"wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
"wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
"mv PowerlineSymbols.otf ~/.fonts/
"fc-cache -vf ~/.fonts/
"mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/


set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Custom airline theme
let g:airline_theme='solarized'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1

" }}}


" Linters and checkers {{{
let g:deoplete#enable_at_startup = 1
let g:deoplet#enable_camel_case = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/c++/6.3.1'
let g:deoplete#sources#clang#std = { 'cpp': 'c++1z' }

autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
set completeopt-=preview


imap <silent><expr><Tab> (pumvisible() ? "<C-n>" : (<SID>is_whitespace() ? "\<Tab>" : deoplete#manual_complete()))
inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"

"smap <silent><expr><Tab> pumvisible() ? "\<Down>"
    "\ : (<SID>is_whitespace() ? "\<Tab>"
	"\ : deoplete#manual_complete()))


function! s:is_whitespace()
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction

"\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
"let g:deoplete#max_menu_width = 10
let g:deoplete#max_list = 10

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

let g:neomake_open_list = 2
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
    \ 'exe' : 'clang++',
    \ 'args' : [ 'c++1z', '-Wc++11']
    \ }

let g:neomake_warning_sign = {
    \ 'text': 'W',
    \ 'texthl': 'WarningMsg',
    \ }
let g:neomake_error_sign = {
    \ 'text': 'E',
    \ 'texthl': 'ErrorMsg',
    \ }

autocmd! BufWritePost,BufEnter * Neomake

autocmd! FileType cpp ClangFormatAutoEnable

" }}}


" Misc {{{

let g:AutoPairs = { '(': ')', '[': ']', '{': '}', "'": "'", '"': '"'}
let g:AutoPairsFlyMode = 0

let g:session_autosave = 'no'

let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 3
let g:hardtime_allow_different_key = 1


let g:lessspace_enabled = 1
let g:lessspace_normal = 1
let g:lessspace_whitelist = ['vim']
let g:lessspace_blacklist = ['*']

let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

cmap w!! w !sudo tee % >/dev/null

" Reload vimrc on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
augroup END " }

" }}}
