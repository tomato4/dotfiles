let mapleader = "\<Space>"

set nocompatible

" Enable hidden buffers
set hidden

" disable sound on eol
set noerrorbells

" Color support
set termguicolors

" Sane settings
filetype plugin on
syntax on

" Setup clipboard to system clipboard
set clipboard+=unnamedplus

" Relative Linenumbers
set nu rnu

" Case insensitive search until big letter appeared
set ignorecase
set smartcase

" Mouse support
set mouse=a

" Tab settings
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4

" disable backup and swap and enable file for it
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" sensible settings (:help 'option')
set scrolloff=5 "set 5 space above cursor
