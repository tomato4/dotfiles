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
set scrolloff=5 "set 5 space above cursor

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
			\'coc-phpls',
			\'coc-xml',
			\'coc-yaml',
			\'coc-clangd',
			\'coc-sh',
			\'coc-discord-rpc',
			\'coc-highlight',
			\'coc-diagnostic',
			\'coc-markdownlint',
			\'coc-pairs',
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
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'gko/vim-coloresque'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-sensible'
Plug 'metakirby5/codi.vim'
Plug 'https://github.com/chrisbra/unicode.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" Vim Which key settings
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

" fzf settings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" load settings for rangevim plug
source $HOME/dotfiles/nvim/plug-config/rnvimr.vim

" NerdTree git highlight
let g:NERDTreeGitStatusWithFlags = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "#528AB3",  
    \ "Staged"    : "#538B54",  
    \ "Untracked" : "#BE5849",  
    \ "Dirty"     : "#299999",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }   

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" NerdCommenter
map <silent><c-_> :call NERDComment('n', 'Toggle')<CR>

" save as root
com -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod
