" Options
set number
set relativenumber
set scrolloff=8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Nice when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Plugins
call plug#begin()

Plug 'mhartington/oceanic-next'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'thosakwe/vim-flutter'

call plug#end()

" Dart options
let dart_html_in_string = v:true
let g:dart_format_on_save = 1
" Flutter options
let g:flutter_autoscroll = 1

" Color scheme
set termguicolors
colorscheme OceanicNext

" Remaps
let mapleader = " "

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <C-l> :Lines<CR>
nnoremap <C-f> :Rg! 
let g:fzf_layout = { 'down': '40%' }

" Flutter
nnoremap <leader>fa :FlutterRun<CR>
nnoremap <leader>fq :FlutterQuit<CR>
nnoremap <leader>fr :FlutterHotReload<CR>
nnoremap <leader>fR :FlutterHotRestart<CR>
nnoremap <leader>fD :FlutterVisualDebug<CR>

" Project file tree
nnoremap <leader>pv :Lex<CR>
let g:netrw_winsize = 25

