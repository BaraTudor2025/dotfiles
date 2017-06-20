" ===============================================
" ======= Bara Tudor si firmele lui S.R.L. ======
" ===============================================


" Leaders and init {{{
let g:mapleader = "\<space>"
let g:maplocalleader = ','
augroup vim_enter
    au!
augroup END
"}}}


" Plugins {{{

" Autoinstall vim-plug {{{

fun! InstallVimPlug()
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd! vim_enter VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endfun

fun! InstallNeovimPlug()
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd! vim_enter VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endfun

" Always neovim
if has('nvim') || 1
    let s:plugs_dir = '~/.local/share/nvim/plugged'
    call InstallNeovimPlug()
else
    let s:plugs_dir = '~/.vim/plugged'
    call InstallVimPlug()
endif

" }}}

call plug#begin(s:plugs_dir)

" Colorschemes and Visuals {{{
" ====================================================================================
Plug 'iCyMind/NeoSolarized'
Plug 'chriskempson/base16-vim'
" Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'cschlueter/vim-wombat'
Plug 'tmux-plugins/vim-tmux'

" Syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight' , { 'for' : 'cpp' }
Plug 'mizuchi/stl-syntax' , { 'for' : 'cpp' }
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_powerline_fonts = 1

Plug 'Yggdroot/indentLine'

Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#pairs = [['(', ')']]
augroup file_type
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

Plug 'maciej-ka/ZoomWin'
nmap <silent> <leader>z :ZoomWin<cr>

Plug 'mhinz/vim-startify'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()

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
let g:fzf_layout = { 'down': '~25%' }
nnoremap F :Files ~<cr>
nnoremap <leader>f :Files <cr>
nnoremap <leader>b :Buffers<cr>

Plug 'easymotion/vim-easymotion'
nmap s <Plug>(easymotion-overwin-f2)
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
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/projectionist.vim'

"}}}


" Editing {{{
" ============================================================
Plug 'thirtythreeforty/lessspace.vim'
let g:lessspace_enabled = 1
let g:lessspace_normal = 1
" let g:lessspace_whitelist = ['vim']
" let g:lessspace_blacklist = ['*']

Plug 'jiangmiao/auto-pairs'
" let g:AutoPairs = { '(': ')' , '[': ']' , '{': '}', "'": "'", '"': '"'}
let g:AutoPairsFlyMode = 1

Plug 'mattn/emmet-vim'
autocmd! Filetype html,css :EmmetInstall

Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'AndrewRadev/sideways.vim'
nnoremap <M-h> :SidewaysLeft<cr>
nnoremap <M-l> :SidewaysRight<cr>

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
if has('persistent_undo')
    set undodir=~/.undodir/
    set undofile
endif

" Plug 'vim-scripts/paredit.vim'
" autocmd FileType * call PareditInitBuffer()
" let g:paredit_mode=1

Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'rhysd/vim-clang-format', { 'for' : 'cpp' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'brooth/far.vim'
Plug 'wellle/targets.vim'
" Plug 'kana/vim-textobj-user'

" }}}


" Autocomletion, Linters, Snippets {{{
" ============================================================
" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer' }
Plug 'ervandew/supertab'

" Plug 'Shougo/deoplete.nvim' , { 'do' : ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang' , { 'for' : 'cpp' }
" Plug 'Shougo/neoinclude.vim' , { 'for' : 'cpp' }

" Linters
" Plug 'neomake/neomake'
" Plug 'metakirby5/codi.vim'
Plug 'Shougo/neco-vim'
Plug 'neitanod/vim-clevertab'
Plug 'w0rp/ale'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

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

" Basic settings {{{

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
" filetype plugin indent on

syntax on
set ruler
set wrap
set noshowmode
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
set nohlsearch
set noincsearch
set foldmethod=marker
set shell=/bin/bash
set laststatus=2

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

function! ToggleWrap()
    if &wrap
        set nowrap
    else
        set wrap
    endif
endfunction

" }}}


" Mappings {{{

" Insert a single character
nmap <leader>i i <esc>r

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<cr>

" Execute last command | replay macro
" nmap Q @:
nmap Q @q

cmap w!! w !sudo tee % >/dev/null
cmap qq q!

" copy and paste a paragraph below
" noremap cp yap<S-}>p
" nmap cp :let @+ = expand("%:p")<cr>

" Easy column
nnoremap ; :

" yank like pro
nnoremap Y y$

" Better ESC
inoremap jk <Esc>`^
inoremap jj <Esc>`^

" Faster navigation
map J 5j
map K 5k
map H ^
map L $

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>
imap <c-o> <esc>oi

" Insert semicolomn at end of line in insert mode
inoremap ;; <end>A;
inoremap ,, <end>A,

" use ctrl-e/a goto begining or end of line
inoremap <c-e> <end>
inoremap <c-a> <home>

" Edits wraped lines
noremap j gj
noremap k gk
noremap 0 g0
noremap ^ g^
noremap $ g$

" Align text blocks and keep them highlighted
xnoremap <nowait> < <gv
xnoremap <nowait> > >gv

" Toggle search highlight
let g:hlstate=0
command! ToggleHilight :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" }}}


" Colors {{{

set termguicolors
set background=dark
" colo NeoSolarized
" colo base16-oceanicnext
" colo base16-onedark
" let g:airline_theme = 'solarized'
autocmd vim_enter VimEnter * Tmuxline powerline
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_contrast_dark = 'medium'
colo gruvbox
" colo base16-default-dark
" colo base16-eighties

" Workaround {{{

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

" }}}

" }}}


" ALE YCM UltiSnips {{{
let g:ycm_python_binary_path = '/usr/bin/python3'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<cr>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_semantic_triggers = {'haskell' : ['.']}

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_key_invoke_completion = '<c-j>'
let g:ycm_complete_in_strings = 1
set pumheight=10

let g:ale_sign_error = '>>'
let g:ale_sign_warning = 'W'
let g:ale_sign_collumn_always = 1
let g:ale_set_loclist = 1
let g:ale_set_quiqkfix = 0
" let g:ale_lint_on_save = 'never'
let g:ale_lint_on_text_changed = 'never'


nmap <silent><M-k> <Plug>(ale_previous_wrap)
nmap <silent><M-j> <Plug>(ale_next_wrap)

let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

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

" Use leader + b to build current file in his directory
" nmap <silent><leader>b :cd %:h<cr> :Neomake!<cr> :!./a.out<cr>

" let g:neomake_open_list = 2
" let g:neomake_cpp_enabled_makers = ['clang']
" let g:neomake_cpp_clang_maker = {
"    \ 'exe' : 'clang++',
"    \ 'args' : [ '-std=c++1z', '-Wall', '-Wno-c++11-extensions']
"    \ }

"let g:neomake_c_enabled_makers = ['gcc']
"let g:neomake_c_gcc_maker = {
    " \ 'exe' : 'gcc',
    " \ 'args' : [ '-Wall' ]
    " \ }

" let g:neomake_warning_sign = {
    " \ 'text': 'W',
    " \ 'texthl': 'WarningMsg',
    " \ }
" let g:neomake_error_sign = {
    " \ 'text': 'E',
    " \ 'texthl': 'ErrorMsg',
    " \ }

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
