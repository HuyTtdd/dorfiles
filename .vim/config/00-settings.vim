set number
set relativenumber
set noshowmode
set encoding=utf-8
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set showtabline=1
set background=dark
set signcolumn=yes
set colorcolumn=81
set scrolloff=5
set splitright
set guicursor=i-ci:block,i-ci:blinkon250-blink0ff50,n:blinkon0
autocmd BufNew,BufRead *.asm,*.s set ft=nasm
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
