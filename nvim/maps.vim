" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dW vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W call SudoWrite()

function! SudoWrite()
  let l:password = inputsecret("Password: ")
  let l:cmd = "echo '" . shellescape(l:password) . "' | sudo -S tee " . shellescape(expand('%:p')) . " > /dev/null"
  execute 'write !' . l:cmd
endfunction

" Comment line
nmap <silent><c-_> gcc<CR>
vmap <silent><c-_> gc<CR>

" File manager shortcut
nnoremap <leader>v <cmd>CHADopen<cr>

" Search for selected text {{{
" Forwards
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
" Backwards
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
" }}}

" Tabs {{{
" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
"}}}

" Windows {{{
" Create new window
nnoremap <C-t> :tabnew<CR>
" Split window
nmap ss :sturn><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" window resize mapping
noremap <silent> <C-S-Left> :vertical resize +3<CR>
noremap <silent> <C-S-Right> :vertical resize -3<CR>
noremap <silent> <C-S-Up> :resize +3<CR>
noremap <silent> <C-S-Down> :resize -3<CR>
" }}}

" vim: set foldmethod=marker foldlevel=0:
