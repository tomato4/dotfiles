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
set smartindent
set shiftwidth=4

" disable backup and swap and enable file for it
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" sensible settings (:help 'option')
set scrolloff=3 "set 3 space above cursor

" Settings for vim-polyglot
let g:polyglot_disabled = ['markdown']

" Autocompleters for coc.nvim
let g:coc_global_extensions = [
			\'coc-json',
			\'coc-git',
			\'coc-python',
			\'coc-java',
			\'coc-html',
			\'coc-css',
			\'coc-clangd',
			\'coc-sh',
			\'coc-discord-rpc',
			\'coc-highlight',
			\]

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'violet'

" Manage plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'powerline/fonts'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'gko/vim-coloresque'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-sensible'
Plug 'metakirby5/codi.vim'
Plug 'https://github.com/chrisbra/unicode.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'dense-analysis/ale'
" Plug 'scrooloose/syntastic'

" Themes
Plug 'dracula/vim', {'as': 'dracula' }
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'liuchengxu/space-vim-dark'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'sainnhe/edge'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ALE setup
"let g:ale_fixers = {
"\	'*': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint']
"\}
"let g:ale_fix_on_save = 1

" Syntastic setup
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Set rainbow parentheses
let g:rainbow_active = 1

" Set colorscheme
colorscheme dracula

" NERDTree config
" <C-t> = ctrl-t
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t>     :NERDTreeToggle<CR>
nnoremap <C-f>     :NERDTreeFind<CR>

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

" Mapping Tab commands
nnoremap <leader>g :tabprevious<CR>
nnoremap <leader>h :tabnext<CR>
nnoremap <C-S-T> :tabclose<CR>
nnoremap <C-t> :tabnew<CR>

" load settings for rangevim plug
source $HOME/dotfiles/nvim/plug-config/rnvimr.vim

" save as root
com -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod
