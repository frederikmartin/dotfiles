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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

call plug#end()

" LSP config
lua require("lsp_config")

" Color scheme
set termguicolors
colorscheme OceanicNext

" Remaps
let mapleader = " "

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Project file tree
nnoremap <leader>pv :Lex<CR>
let g:netrw_winsize = 25

" Search result highlighting
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>
nnoremap <silent> <Space> :set hlsearch!<CR>

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" Fzf
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>bf :Buffers<CR>
nnoremap <silent> <C-l> :Lines<CR>
nnoremap <C-f> :Rg! 
let g:fzf_layout = { 'down': '40%' }

