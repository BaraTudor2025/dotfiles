" ===============================================
" ======= Bara Tudor si firmele lui S.R.L. ======
" ===============================================


" Leaders {{{
let g:mapleader = "\<space>"
let g:maplocalleader = ','
"}}}


" Plugins {{{

" Autoinstall vim-plug
if empty(glob('~/.config/nvim/plugged'))
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd! VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'Vector2025/targets.vim'

" Colorschemes and visuals {{{
" ====================================================================================
Plug 'iCyMind/NeoSolarized'
Plug 'vim-scripts/asu1dark.vim'
Plug 'felixhummel/setcolors.vim'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'

" Syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight' , { 'for' : 'cpp' }
Plug 'mizuchi/stl-syntax' , { 'for' : 'cpp' }
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ! wget "https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/airline/themes/gruvbox.vim"
"    \ -P ~/.config/nvim/plugged/vim-airline-themes/autoload/airline/themes
set laststatus=2
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_powerline_fonts = 1


Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 0

Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#pairs = [['(', ')']]
augroup file_type
    autocmd!
    autocmd FileType lisp, clojure, scheme RainbowParentheses
augroup END


Plug 'vim-scripts/ZoomWin'
nmap <silent> <leader>z :ZoomWin<cr>

Plug 'mhinz/vim-startify'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/goyo.vim'

" }}}


" Navigation {{{
" ============================================================
Plug 'scrooloose/nerdtree'
nmap <silent> <leader>n :NERDTreeCWD<cr>
let g:NERDTreeWinSize = 25
" Close vim if nerdtree is lonely
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | :q | endif


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap F :FZF ~<cr>
nnoremap <leader>f :FZF <cr>
nnoremap <leader>b :Buffers<cr>


Plug 'easymotion/vim-easymotion'
map s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-overwin-f)
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>l <Plug>(easymotion-overwin-line)
vmap <Leader>l <Plug>(easymotion-bd-jk)
map f <Plug>(easymotion-sl)
map t <Plug>(easymotion-bd-tl)
let g:EasyMotion_smartcase = 1


Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 3
let g:hardtime_allow_different_key = 1

Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/camelcasemotion'
" Plug 'tpope/projectionist.vim'


"}}}


" Editing {{{
" ============================================================
Plug 'thirtythreeforty/lessspace.vim'
let g:lessspace_enabled = 1
let g:lessspace_normal = 1
let g:lessspace_whitelist = ['vim']
let g:lessspace_blacklist = ['*']

Plug 'jiangmiao/auto-pairs'
let g:AutoPairs = { '(': ')' , '[': ']' , '{': '}', "'": "'", '"': '"'}
xmap ga <Plug>(EasyAlign)
let g:AutoPairsFlyMode = 0

Plug 'mattn/emmet-vim'
" let g:user_emmet_install_global = 0
autocmd Filetype html, css EmmetInstall

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'AndrewRadev/sideways.vim'
" nnoremap <c-h> :SidewaysLeft<cr>
" nnoremap <c-l> :SidewaysRight<cr>

Plug 'rhysd/vim-clang-format', { 'for' : 'cpp' }
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'brooth/far.vim'
Plug 'tpope/vim-abolish'
" Plug 'kana/vim-textobj-user'
Plug 'Vector2025/targets.vim'

" }}}


" Autocomletion, Linters, Snippets {{{
" ============================================================
" Autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer' }

" Plug 'Shougo/deoplete.nvim' , { 'do' : ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang' , { 'for' : 'cpp' }
" Plug 'Shougo/neoinclude.vim' , { 'for' : 'cpp' }

" Linters
" Plug 'neomake/neomake'
Plug 'Shougo/neco-vim'
Plug 'neitanod/vim-clevertab'
Plug 'w0rp/ale'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

"}}}


" Utility {{{
" ============================================================
Plug 'szw/vim-g'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_column_always = 1

Plug 'xolox/vim-session'
let g:session_autosave = 'yes'
let g:session_command_aliases = 1
" }}}

call plug#end()

" }}}


" General settings {{{

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

syntax on
set ruler
set wrap
set history=1000
set hidden      " change buffer without saving
" set cursorline  " highlight line
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


function! ToggleWrap()
    if &wrap
        set nowrap
    else
        set wrap
    endif
endfunction

" }}}


" Mappings {{{

set foldmethod=marker

" Insert a single character
nmap <leader>i i <esc>r

" Split this window
nnoremap <leader>v <C-w>v<C-w>l

" Install Plugs
nmap <silent> <leader>ip :PlugInstall<cr>
nmap <silent> <leader>up :PlugUpdate<cr>

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>

" Execute last command
nmap Q @:

cmap w!! w !sudo tee % >/dev/null
cmap qq q!

" copy and paste a paragraph below
" noremap cp yap<S-}>p
" nmap cp :let @+ = expand("%:p")<cr>

" Easy column
nnoremap ; :

" Better ESC
inoremap jk <Esc>`^
inoremap jj <Esc>`^

" Select last paste in visual mode
" nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Insert semicolomn at end of line in insert mode
inoremap ;; <esc>A;

" Buffer movement
"nnoremap gn :bnext<cr>
"nnoremap gp :bprevious<cr>
"nnoremap gd :bdelete<cr>
"nnoremap gf <C-^>

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

" }}}


" Colors {{{

set termguicolors
set background=dark
colorscheme NeoSolarized
let g:airline_theme='solarized'
" colorscheme gruvbox
" let g:airline_theme='gruvbox'


" Pretty Visuals
highlight! link Visual Folded
highlight! link IncSearch DiffChange
highlight! link Search DiffChange

" Workaround because colorscheme clears the easy motion highlights
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

" pentru a rezolza bug-ul cu highlight-ul commenteaza linia din fisiereul
"/home/tudor/.config/nvim/plugged/vim-easymotion/autoload/EasyMotion/highlight.vim
"unlet g:save_cpo

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

" Mark the last editerd file
augroup buf_leave
    autocmd!
    autocmd BufLeave *.cpp  normal! mC
    autocmd BufLeave *.h    normal! mH
    autocmd BufLeave *.vim  normal! mV
    autocmd BufLeave *.hpp  normal! mH
    autocmd BufLeave *.hs   normal! mL
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
" }}}


" Neomake (disabled) {{{

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


" Deoplete (disabled){{{

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
