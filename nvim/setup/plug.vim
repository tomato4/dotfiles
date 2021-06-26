call plug#begin(stdpath('data') . '/plugged')
Plug 'powerline/fonts'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
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
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'kana/vim-submode'
Plug 'sapphirecat/php-psr2-vim'
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
