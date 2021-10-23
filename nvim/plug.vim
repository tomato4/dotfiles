if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

if has("nvim")
endif

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
