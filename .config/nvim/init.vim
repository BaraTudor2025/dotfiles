set foldmethod=marker

" ===============================================
" ======= Bara Tudor si firmele lui S.R.L. ======
" ===============================================


" Plugins {{{

" install vim-plug on new machine
if empty(glob('~/.config/nvim/plugged'))
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd! VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/ZoomWin'
Plug 'mhinz/vim-startify'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'

" Edit
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-abolish'
"Plug 'godlygeek/tabular'

" Syntax highlight
Plug 'iCyMind/NeoSolarized'
Plug 'vim-scripts/asu1dark.vim'
Plug 'felixhummel/setcolors.vim'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'octol/vim-cpp-enhanced-highlight' , { 'for' : 'cpp' }
Plug 'mizuchi/stl-syntax' , { 'for' : 'cpp' }
Plug 'Shougo/neco-vim'

" Autocomletion and Linters
" Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'neitanod/vim-clevertab'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'rhysd/vim-clang-format', { 'for' : 'cpp' }
" Plug 'Shougo/neoinclude.vim' , { 'for' : 'cpp' }
" Plug 'Shougo/deoplete.nvim' , { 'do' : ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang' , { 'for' : 'cpp' }

" GitHub integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Disable hjkl and other useless shit
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

" Terminal powerline
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'


call plug#end()

" }}}


" General settings {{{

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

syntax on
set ruler
set nowrap
set history=1000
set hidden      " change buffer without saving
set cursorline  " highlight line
set title       " change the terminal title
set guicursor=  " set block cursor
set clipboard+=unnamedplus " use os clipboard
set nolist
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set nobackup
set noswapfile
set scrolloff=2
set autochdir
set pastetoggle=<leader>p
set nohlsearch
set noincsearch
set shell=/bin/bash

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set smartcase
set ignorecase
set wildignorecase

set number relativenumber
augroup relative_num
    autocmd! InsertEnter * set norelativenumber
    autocmd! InsertLeave * set relativenumber
augroup END

" set guifont=Consolas:h13 " not working in terminal

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

" let g:user_emmet_install_global = 0
autocmd Filetype html, css EmmetInstall

function! ToggleWrap()
    if &wrap
        set nowrap
    else
        set wrap
    endif
endfunction

" }}}


" Mappings {{{

let g:mapleader = "\<space>"
let g:maplocalleader = ','

" Insert a single character
nmap <leader>i i <esc>r

" Split this window
nnoremap <leader>v <C-w>v<C-w>l

" Install Plugs
nmap <silent> <leader>ip :PlugInstall<cr>
nmap <silent> <leader>up :PlugUpdate<cr>

" Go fullscreen or use Goyo
nmap <silent> <leader>z :ZoomWin<cr>

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>

" Open nerd tree with ctrl-n
nmap <silent> <leader>n :NERDTreeCWD<cr>
let g:NERDTreeWinSize = 25

" Execute last command
nmap Q @:

cmap w!! w !sudo tee % >/dev/null
cmap qq q!

nnoremap <leader>b :Buffers<cr>

" copy and paste a paragraph below
noremap cp yap<S-}>p

nnoremap F :FZF ~<cr>
nnoremap <leader>f :FZF <cr>
" let $FZF_DEFAULT_COMMAND = 'find . -type f'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Easy column
nnoremap ; :

" Better ESC
inoremap jk <Esc>`^
inoremap jj <Esc>`^

" Delete a line in insert mode
inoremap <c-d> <esc> ddi

" Select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Insert semicolomn at end of line in insert mode
inoremap ;; <esc>A;

" Buffer movement
nnoremap gn :bnext<cr>
nnoremap gp :bprevious<cr>
nnoremap gd :bdelete<cr>
nnoremap gf <C-^>

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>

" Faster navigation
map J 5j
map K 5k
map H ^
map L $

" Align text blocks and keep them highlighted
vmap < <gv
vmap > >gv
nmap < <<
nmap > >>

" Edits wraped lines
noremap j gj
noremap k gk
noremap 0 g0
noremap ^ g^
noremap $ g$

" Easy motion mappings
map s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-overwin-f)

map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap <Leader>l <Plug>(easymotion-overwin-line)
vmap <Leader>l <Plug>(easymotion-bd-jk)

map f <Plug>(easymotion-sl)

map t <Plug>(easymotion-bd-tl)

let g:EasyMotion_smartcase = 1

" }}}


" Colors {{{


set termguicolors
set background=dark
colorscheme NeoSolarized
highlight! link Visual Folded
highlight! link IncSearch DiffChange
highlight! link Search DiffChange

highlight! EasyMotionTargetDefault          cterm=bold ctermfg=196 gui=bold guifg=#ff0000
highlight! EasyMotionTarget2FirstDefault    cterm=bold ctermfg=11 gui=bold guifg=#ffb400
highlight! EasyMotionTarget2SecondDefault   cterm=bold ctermfg=3 gui=bold guifg=#b98300
highlight! EasyMotionMoveHLDefault          cterm=bold ctermfg=15 ctermbg=10 gui=bold guifg=#121813 guibg=#7fbf00
highlight! EasyMotionShadeDefault           ctermfg=242 guifg=#777777
highlight! EasyMotionIncSearchDefault       cterm=bold ctermfg=40 gui=bold guifg=#7fbf00
highlight! EasyMotionIncCursorDefault       cterm=bold ctermfg=232 ctermbg=14 gui=bold guifg=#121813 guibg=#ACDBDA
highlight! link EasyMotionTarget            EasyMotionTargetDefault
highlight! link EasyMotionTarget2First      EasyMotionTarget2FirstDefault
highlight! link EasyMotionTarget2Second     EasyMotionTarget2SecondDefault
highlight! link EasyMotionShade             EasyMotionShadeDefault
highlight! link EasyMotionIncSearch         EasyMotionIncSearchDefault
highlight! link EasyMotionIncCursor         EasyMotionIncCursorDefault

let g:rainbow#pairs = [['(', ')']]

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


" }}}


" ALE {{{
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
"
" " better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger="<cr>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
  " let g:ycm_autoclose_preview_window_after_completion = 1
  " let g:ycm_seed_identifiers_with_syntax = 1
  " let g:ycm_collect_identifiers_from_tags_files = 1
  " let g:ycm_key_invoke_completion = '<c-j>'
  " let g:ycm_complete_in_strings = 1
" }}}


" Autocommands {{{

" augroup vim_enter
"     autocmd!
"     autocmd VimEnter * GitGutterSignsDisable
" augroup END

augroup file_type
    autocmd!
    autocmd FileType lisp, clojure, scheme RainbowParentheses
augroup END

" Mark the last editerd file
augroup buf_leave
    autocmd!
    autocmd BufLeave *.cpp  normal! mC
    autocmd BufLeave *.h    normal! mH
    autocmd BufLeave *.hpp  normal! mH
    autocmd BufLeave *.hs   normal! mL
augroup END

augroup buf_enter
    autocmd!
    autocmd BufRead * call ReadOnlyKeys()
    autocmd BufReadPost * call CursorPos()
    autocmd BufRead * :normal zz
augroup END

" Close vim if nerdtree is lonely
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | :q | endif

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
