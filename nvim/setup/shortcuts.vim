" win key maping
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>

" Tab mapping commands
nnoremap <leader>g :tabprevious<CR>
nnoremap <leader>h :tabnext<CR>
nnoremap <C-S-T> :tabclose<CR>

" Undotree shortcut
nnoremap <leader>u :UndotreeShow<CR>

" Edit configs
" <S-s> = Shift-s
nnoremap <leader><S-s> :Ex $HOME/dotfiles<CR>
nnoremap <leader>s     :e $HOME/dotfiles/nvim/init.vim<CR>

" save as root
com -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod
nnoremap <C-t> :tabnew<CR>
