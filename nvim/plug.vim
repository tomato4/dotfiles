if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive' " Git commands
Plug 'tpope/vim-rhubarb' " fugitive extension - Hub commands, urls, issues

if has("nvim")
    Plug 'windwp/nvim-autopairs' " Autopairing brackets, etc.
    Plug 'neovim/nvim-lspconfig' " LSP configuration
    Plug 'williamboman/nvim-lsp-installer' " LSP servers installer
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " Autocompletion
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} " autocompletion snippets
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'} " third party snippets
    Plug 'glepnir/lspsaga.nvim' " LSP plugin for UI
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better coloring based on language
    Plug 'nvim-lua/popup.nvim' " DEP for telescope; Popup window management
    Plug 'nvim-lua/plenary.nvim' " DEP for telescope; async module
    Plug 'nvim-telescope/telescope.nvim' " Fuzy like browser
    Plug 'kyazdani42/nvim-web-devicons' " Custom icons for telescope
    Plug 'hoob3rt/lualine.nvim' " Lualine = powerline status bar
    Plug 'b3nj5m1n/kommentary' " Plugin for comments
endif

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
