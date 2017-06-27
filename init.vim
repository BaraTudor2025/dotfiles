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

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd! vim_enter VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" }}}

call plug#begin( '~/.local/share/nvim/plugged')

" Colorschemes and Visuals ================================================ {{{
Plug 'iCyMind/NeoSolarized'
Plug 'chriskempson/base16-vim'
" Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" Plug 'biskark/vim-ultimate-colorscheme-utility'
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

Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#pairs = [['(', ')']]

Plug 'maciej-ka/ZoomWin'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'ryanss/vim-hackernews'
" Plug 'pseewald/anyfold'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" }}}


" Navigation ============================================================== {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:fzf_layout = { 'down': '~25%' }

Plug 'scrooloose/nerdtree'
let g:NERDTreeWinSize = 25

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1

Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 3
let g:hardtime_allow_different_key = 1

Plug 'christoomey/vim-tmux-navigator'
Plug 'artnez/vim-wipeout'
Plug 'vim-scripts/camelcasemotion'
Plug 'rking/ag.vim'
" Plug 'eugen0329/vim-esearch'
Plug 'bronson/vim-visual-star-search'
" Plug 'tpope/projectionist.vim'
" Plug 'Chun-Yang/vim-action-ag'
" Plug 'vim-scripts/a.vim'

"}}}


" Editing ================================================================= {{{

Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'AndrewRadev/sideways.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'rhysd/vim-clang-format', { 'for' : 'cpp' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'brooth/far.vim'
Plug 'tommcdo/vim-exchange'
Plug 'svermeulen/vim-easyclip'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-function'
Plug 'michaeljsmith/vim-indent-object'

" }}}


" Utility  ================================================================ {{{
Plug 'szw/vim-g'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
Plug 'tpope/vim-fugitive'
Plug 'Vector2025/vim-superman'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_column_always = 1

Plug 'xolox/vim-session'
let g:session_autosave = 'yes'
let g:session_command_aliases = 1

Plug 'christoomey/vim-system-copy'
let g:system_copy#paste_command='xclip -sel clipboard -o'
let g:system_copy#copy_command='xclip -sel clipboard'

" }}}


" Language Utilitys ======================================================= {{{
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer' }
Plug 'ervandew/supertab'
Plug 'Shougo/neco-vim'
Plug 'neitanod/vim-clevertab'
Plug 'w0rp/ale'
Plug 'Shougo/echodoc.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'thinca/vim-quickrun'
" Plug 'Shougo/deoplete.nvim' , { 'do' : ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang' , { 'for' : 'cpp' }
" Plug 'Shougo/neoinclude.vim' , { 'for' : 'cpp' }
" Plug 'neomake/neomake'
" Plug 'metakirby5/codi.vim'

"}}}

call plug#end()

" }}}


" Basic settings {{{

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
" filetype plugin indent on

syntax on
set wrap
set noshowmode
set history=1000
set hidden      " change buffer without saving
set title       " change the terminal title
set guicursor=  " set block cursor
set nolist
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set nobackup
set noswapfile
set scrolloff=2
set autochdir
set foldmethod=marker
" set shell=/bin/bash
set laststatus=2
set lazyredraw

set undodir=~/.undodir/
set undofile

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set gdefault
set nohlsearch
set noincsearch
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


" Mapping {{{

" Comands
command! Root call s:root()

" Toggle search highlight
let g:hlstate=0
command! ToggleHilight :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" Insert a single character
nmap <leader>i i <esc>r

" Edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>rv :source $MYVIMRC<bar>:Tmuxline powerline<cr>

" Replay macro
nmap Q @q

cmap w!! w !sudo tee % >/dev/null
cmap qq qa!

" Ex mode navigation
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-w> <c-right>
cnoremap <c-b> <c-left>
cnoremap <c-j> <left>
cnoremap <c-k> <right>

" Easy column
nnoremap ; :

" Yank like pro
nnoremap Y y$

" Mark is gm
nnoremap gm m

" Close quickfix or loclist
nnoremap <leader>c :cclose<bar>lclose<cr>

" Use tab to go to previous buffer
nnoremap <tab> <c-^>

" Better ESC
inoremap jk <Esc>`^
cnoremap jk <C-c>

" Faster navigation
map J 5j
map K 5k
map H ^
map L $

" Scroll
nnoremap <M-d> <c-d>
nnoremap <M-u> <c-u>

" Insert line
nnoremap o o<ESC>
nnoremap O O<ESC>
inoremap <c-o> <esc>o

" Insert semicolomn at end of line in insert mode
inoremap ;; <end>;
inoremap ,, <end>,

" Unimpaired
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>
nnoremap [l :lprev<cr>
nnoremap ]l :lnext<cr>
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>
nnoremap [t :tabprev<cr>
nnoremap ]t :tabnext<cr>
nnoremap [e <Plug>(ale_previous_wrap)
nnoremap ]e <Plug>(ale_next_wrap)

" Use ctrl-e/a goto begining or end of line
inoremap <c-e> <end>
inoremap <c-a> <home>

" Edits wraped lines
noremap j gj
noremap k gk
noremap 0 g0
noremap ^ g^
noremap $ g$

" goto next/prev indentation level
nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> gpi :<c-u>call <SID>go_indent(v:count1, -1)<cr>

" Align text blocks and keep them highlighted
xnoremap <nowait> < <gv
xnoremap <nowait> > >gv

" Plugin Mapping
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <M-h> :SidewaysLeft<cr>
nnoremap <M-l> :SidewaysRight<cr>

nmap <silent> <leader>z :ZoomWin<cr>

" Fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap F :FzfFiles ~<cr>
nnoremap <leader>f :FzfFiles <cr>
nnoremap <leader>b :FzfBuffers<cr>

nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>l <Plug>(easymotion-overwin-line)
vmap <Leader>l <Plug>(easymotion-bd-jk)
nmap s <Plug>(easymotion-overwin-f2)
map f <Plug>(easymotion-sl)
map t <Plug>(easymotion-bd-tl)

" }}}


" Colors {{{

set termguicolors
set background=dark
" colo NeoSolarized
" colo base16-oceanicnext
" colo base16-onedark
" let g:airline_theme = 'solarized'
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
let g:UltiSnipsExpandTrigger = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_semantic_triggers = {'haskell' : ['.']}

" let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
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


let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" }}}


" Functions {{{

function! s:go_indent(times, dir)
  for l:_ in range(a:times)
    let l:l = line('.')
    let l:x = line('$')
    let l:i = s:indent_len(getline(l:l))
    let l:e = empty(getline(l:l))
    while l:l >= 1 && l:l <=l:x
      let l:line = getline(l:l + a:dir)
      let l:l += a:dir
      if s:indent_len(l:line) != l:i || empty(l:line) !=l:e
        break
      endif
    endwhile
    let l:l = min([max([1, l:l]), l:x])
    execute 'normal! '. l:l .'G^'
  endfor
endfunction

function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:root()
  let l:root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd'l:root
    echo 'Changed directory to: '.l:root
  endif
endfunction

function! s:goyo_enter()
    autocmd! relative_num
    :Limelight
endfunction

function! s:goyo_leave()
    augroup relative_num
        autocmd! InsertEnter * set norelativenumber
        autocmd! InsertLeave * set relativenumber
    augroup END
    :Limelight!
endfunction
" }}}


" Autocommands {{{

autocmd! Filetype html,css :EmmetInstall

augroup goyo_events
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

augroup CursorLineOnlyInActiveWindow
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

augroup lisp_files
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Mark the last editerd file
augroup exit_marks
    autocmd!
    autocmd BufLeave *.cpp  normal! mC
    autocmd BufLeave *.h    normal! mH
    autocmd BufLeave *.vim  normal! mV
    autocmd BufLeave *.hpp  normal! mH
    autocmd BufLeave *.hs   normal! mL
augroup END

augroup buf_enter
    autocmd!
    autocmd BufRead * call s:ReadOnlyMapings()
    autocmd BufReadPost * call s:CursorPos()
    autocmd BufRead * :normal zz
augroup END

function! s:ReadOnlyMapings()
    if &readonly
        noremap <buffer><nowait>d <c-d>
        noremap <buffer>u <c-u>
        noremap <buffer>f <c-f>
        noremap <buffer>b <c-b>
        noremap <buffer>h K
        noremap <buffer>t <c-]> "follow tag
    endif
endfunction

fun! s:CursorPos()
    if line("'\"") > 0 && line ("'\"") <= line ('$')
        execute "normal! g'\""
    endif
endfun

" augroup collumnLimit
"   autocmd!
"   autocmd BufEnter,WinEnter,FileType scala,java
"         \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
"   let collumnLimit = 79 " feel free to customize
"   let pattern =
"         \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
"   autocmd BufEnter,WinEnter,FileType scala,java
"         \ let w:m1=matchadd('CollumnLimit', pattern, -1)
" augroup END

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
