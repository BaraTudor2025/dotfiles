set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

"===============================================
"======= Bara Tudor si firmele lui S.R.L. ======
"===============================================


" PLUGINS WOOO {{{

" install vim-plug on new machine
if empty(glob('~/.config/nvim/plugged'))
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd! vim_enter VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" GitHub integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iCyMind/NeoSolarized'
"Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/rainbow_parentheses.vim'
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
Plug 'brooth/far.vim'

" Edit
"Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-abolish'
"Plug 'godlygeek/tabular'

" Syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight' , { 'for' : 'cpp' }
Plug 'mizuchi/stl-syntax' , { 'for' : 'cpp' }
Plug 'Shougo/neco-vim'

" Autocomletion and Linters
" Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer' }
Plug 'sirver/ultisnips'
Plug 'w0rp/ale'
Plug 'rhysd/vim-clang-format', { 'for' : 'cpp' }
" Plug 'Shougo/neoinclude.vim' , { 'for' : 'cpp' }
" Plug 'Shougo/deoplete.nvim' , { 'do' : ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang' , { 'for' : 'cpp' }

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
set guicursor=   " set block cursor
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
setlocal foldmethod=marker
set autochdir

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set number relativenumber
augroup relative_num
    autocmd! InsertEnter * set norelativenumber
    autocmd! InsertLeave * set relativenumber
augroup END

" }}}


" Mappings {{{

" Make leader space
let g:mapleader="\<space>"

" Disable Q(ex mode) and macro
nmap Q <nop>
nmap q <nop>

cmap w!! w !sudo tee % >/dev/null
cmap qq q!

nmap <c-p> :CtrlP ~<cr>

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

" Better ESC
inoremap jk <Esc>`^
inoremap jj <Esc>`^

" Easy column
nnoremap ; :

" Use tab in noraml mode to move between buffers
nnoremap gn :bnext<cr>
nnoremap gp :bprevious<cr>
nnoremap gd :bdelete<cr>
nnoremap gf <C-^>

" Insert a single character
nmap <leader>i i <esc>r

" Insert semicolomn at end of line in insert mode
inoremap ;; <esc>A;

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>

" Faster navigation
map J 5j
map K 5k
map H ^
map L $

" Edits wraped lines
noremap j gj
noremap k gk
noremap <silent> 0 g0
noremap <silent> ^ g^
noremap <silent> $ g$

" Easy motion mappings
map s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-overwin-f)

map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap <Leader>l <Plug>(easymotion-overwin-line)

map f <Plug>(easymotion-sl)

map t <Plug>(easymotion-bd-tl)

let g:EasyMotion_smartcase = 1

" }}}


" Colors {{{

set termguicolors
set background=dark
colorscheme NeoSolarized
highlight Visual cterm=bold ctermfg=12 ctermbg=0 gui=bold guifg=#839496 guibg=#073642 guisp=#002b36
highlight IncSearch cterm=bold ctermfg=3 ctermbg=0 gui=bold guifg=#b58900 guibg=#073642 guisp=#b58900
highlight Search cterm=bold ctermfg=3 ctermbg=0 gui=bold guifg=#b58900 guibg=#073642 guisp=#b58900
" highlight link Visual Folded
" highlight link IncSearch DiffChange
" highlight link Search DiffChange

exec 'source' '~/.config/nvim/plugged/vim-easymotion/autoload/EasyMotion/highlight.vim'

let g:solarized_termcolors=256
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp, clojure, scheme RainbowParentheses
augroup END

" pentru a rezolza bug-ul cu highlight-ul commenteaza linia din fisiereul
"/home/tudor/.config/nvim/plugged/vim-easymotion/autoload/EasyMotion/highlight.vim
"unlet g:save_cpo


" C++ highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

" Installation commands {{{
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
" }}} install

" }}}


" ALE {{{

let g:ale_sign_error = '>>'
let g:ale_sign_warning = 'W'
let g:ale_sign_collumn_always = 1
let g:ale_set_loclist = 1
let g:ale_set_quiqkfix = 0

" let g:ale_lint_on_save = 'never'
" let g:ale_lint_on_text_changed = 'never'

nmap <silent><M-k> <Plug>(ale_previous_wrap)
nmap <silent><M-j> <Plug>(ale_next_wrap)

let g:ale_open_list = 0

function! ToggleALEwin()
    if g:ale_open_list == 0
        g:ale_open_list = 1
    else
        g:ale_open_list = 0
    endif
endfunction

" }}}


" YouCompleteMe {{{
" let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

" }}}


" Misc {{{

augroup vim_enter
    autocmd!
    autocmd VimEnter * GitGutterSignsDisable
augroup END

let g:gitgutter_sign_column_always = 1

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:AutoPairs = { '(': ')', '[': ']', '{': '}', "'": "'", '"': '"'}
let g:AutoPairsFlyMode = 0

let g:session_autosave = 'yes'
let g:session_command_aliases = 1

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

function! ToggleWrap()
    if &wrap
        set nowrap
    else
        set wrap
    endif
endfunction

" }}}


" Neomake {{{

" " Use leader + b to build current file in his directory
" " nmap <silent><leader>b :cd %:h<cr> :Neomake!<cr> :!./a.out<cr>
"
" let g:neomake_open_list = 2
" let g:neomake_cpp_enabled_makers = ['clang']
" let g:neomake_cpp_clang_maker = {
"     \ 'exe' : 'clang++',
"     \ 'args' : [ '-std=c++1z', '-Wall', '-Wno-c++11-extensions']
"     \ }
"
" let g:neomake_c_enabled_makers = ['gcc']
" let g:neomake_c_gcc_maker = {
"     \ 'exe' : 'gcc',
"     \ 'args' : [ '-Wall' ]
"     \ }
"
" let g:neomake_warning_sign = {
"     \ 'text': 'W',
"     \ 'texthl': 'WarningMsg',
"     \ }
" let g:neomake_error_sign = {
"     \ 'text': 'E',
"     \ 'texthl': 'ErrorMsg',
"     \ }
"
" autocmd! BufWritePost,BufEnter * Neomake
" }}}


" Deoplete {{{

" let g:deoplete#enable_at_startup = 1
" let g:deoplet#enable_camel_case = 1
" let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/include/c++/6.3.1'
"
" autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
" set completeopt-=preview
"
" imap <silent><expr><Tab> (pumvisible() ? "<C-n>" : (<SID>is_whitespace() ? "\<Tab>" : deoplete#manual_complete()))
" inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"
"
" function! s:is_whitespace()
"     let l:col = col('.') - 1
"     return ! l:col || getline('.')[l:col - 1] =~? '\s'
" endfunction
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return deoplete#mappings#smart_close_popup() . "\<CR>"
" endfunction
" let g:deoplete#max_list = 20

" }}}
