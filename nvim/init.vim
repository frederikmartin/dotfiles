" Options
set number " Show line numbers

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

Plug 'vijaymarupudi/nvim-fzf'
Plug 'vijaymarupudi/nvim-fzf-commands'

call plug#end()

