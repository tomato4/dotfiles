let mapleader = "\<Space>"

set nocompatible

" Enable hidden buffers
set hidden

" disable sound on eol
set noerrorbells

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
set smartindent
set shiftwidth=4

" disable backup and swap and enable file for it
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" Settings for vim-polyglot
let g:polyglot_disabled = ['markdown']

" Autocompleters for coc.nvim
let g:coc_global_extensions = [
			\'coc-json',
			\'coc-git',
			\'coc-svelte',
			\'coc-tsserver',
			\'coc-python',
			\'coc-json',
			\'coc-java',
			\'coc-html',
			\'coc-css',
			\'coc-clangd',
			\'coc-sh'
			\]

" Colorscheme Settings
"let g:neosolarized_vertSplitBgTrans = 0
"let g:neosolarized_contrast         = "high"
"let g:neosolarized_visibility       = "high"
"let g:neosolarized_bold             = 1
"let g:neosolarized_underline        = 1
"let g:neosolarized_italic           = 1
"let g:neosolarized_termBoldAsBright = 0

"set background=dark

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'violet'

" Goyo settings
"let g:goyo_width = "70%"

" Manage plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'powerline/fonts'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
"Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"Plug 'gko/vim-coloresque'
"Plug 'rhysd/vim-clang-format'
"Plug 'luochen1990/rainbow', { 'for': 'scheme' }
"Plug 'vimwiki/vimwiki'
"Plug 'tpope/vim-sensible'
"Plug 'sainnhe/edge'
"Plug 'dracula/vim', {'as': 'dracula' }
"Plug 'liuchengxu/space-vim-dark'
"Plug 'tyrannicaltoucan/vim-deep-space'
"Plug 'itchyny/landscape.vim'
"Plug 'soli/prolog-vim'
"Plug 'metakirby5/codi.vim'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/lambdalisue/suda.vim.git'
Plug 'https://github.com/chrisbra/unicode.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'mbbill/undotree'
call plug#end()

" Set rainbow parentheses
let g:rainbow_active = 1

" Set colorscheme
colorscheme onedark

"let g:space_vim_dark_background = 233

" colorscheme dracula

"color space-vim-dark
"hi Comment cterm=italic gui=italic
"hi Normal ctermbg=NONE guibg=NONE
"hi LineNr ctermbg=NONE guibg=NONE
"hi Function cterm=italic gui=italic gui=bold
"hi Function guifg=#b09aff
"hi Identifier guibg=red

" NERDTree config
" <C-t> = ctrl-t
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t>     :NERDTreeToggle<CR>
nnoremap <C-f>     :NERDTreeFind<CR>

" Markdown settings
"autocmd bufreadpre *.md setlocal conceallevel=2
"autocmd bufreadpre *.md setlocal nofoldenable

" Neovide settings
"let g:neovide_cursor_vfx_mode         = "sonicboom"
"let g:neovide_cursor_animation_length = 0.23

" VimWiki settings
"let wiki = {}
"let g:vimwiki_list = [{'path': '$HOME/vimwiki', 'template_path': '$HOME/vimwiki_tpl'}]

" Default <leader> is '\'
" Edit config
" <S-s> = Shift-s
nnoremap <leader><S-s> :Ex $HOME/dotfiles<CR>
nnoremap <leader>s     :e $HOME/dotfiles/nvim/init.vim<CR>

" key maping
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

" load settings for rangevim plug
source $HOME/dotfiles/nvim/plug-config/rnvimr.vim
