" Window navigation mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" window resize mapping
noremap <silent> <C-S-Left> :vertical resize +3<CR>
noremap <silent> <C-S-Right> :vertical resize -3<CR>
noremap <silent> <C-S-Up> :resize +3<CR>
noremap <silent> <C-S-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Tab mapping commands
"nnoremap <leader>g :tabprevious<CR>
"nnoremap <leader>h :tabnext<CR>
"nnoremap <C-S-T> :tabclose<CR>

" Undotree shortcut
nnoremap <leader>u :UndotreeShow<CR>

" Edit configs
" <S-s> = Shift-s
nnoremap <leader><S-s> :e $HOME/dotfiles/nvim/init.vim<CR>
nnoremap <leader>sv :source! $MYVIMRC<CR>

" save as root
com -bar W exe 'w !sudo tee >/dev/null %' | setl nomod
nnoremap <C-t> :tabnew<CR>
