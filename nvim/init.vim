" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" Don't try to be Vi compatible
set nocompatible
" Enable numbers and relative numbers for lines num
set nu rnu
" enable syntax highlighting
syntax enable
" Allow hidding buffer (from screen) without warning (unsaved)
set hidden
" enable mouse support
set mouse=a
" Encoding for particular file
set fileencodings=utf-8
" encoding of vim internally
set encoding=utf-8
" show name of file for eg. terminal
set title
" autoindent code when enter pressed
set autoindent
" do not make copy when writting
set nobackup
" highlight search
set hlsearch
" show cmd(keys) queue
set showcmd
" height of CMD line
set cmdheight=1
" 2 -> show always, 1 -> only more win, 0 -> never
set laststatus=2
" number of lines before/after current line
set scrolloff=10
" use spaces when tab pressed
set expandtab
" set default shell
set shell=fish
" location of vim swap files
set backupskip=/tmp/*,/private/tmp/*

" live substitution (only neovim)
if has('nvim')
  set inccommand=nosplit
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw
" when brackets close, show beginning
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" Ignore case when searching
set ignorecase
" insert tabs on the start of a line according to shiftwidth, not tabstop
" go to next indent when at the beginning
set smarttab

" Indents "{{{
filetype plugin indent on
" Width of tabstop (Tab)
set tabstop=4
" Size of an indent
set shiftwidth=4
" tab key will insert comb of spaces and tabs
set softtabstop=0
" autoindent code when enter pressed
set autoindent
" react to syntax of code
set smartindent "Smart indent
" don't wrap (autoenter new line) code
set nowrap
" Finding files - Search down into subfolders
"set path+=**
set wildignore+=*/node_modules/*
"}}}

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------

" Highlight current line
set cursorline

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use Dracula
  colorscheme dracula
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
set secure
"}}}

" vim: set foldmethod=marker foldlevel=0:
