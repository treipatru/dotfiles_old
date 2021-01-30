" Status
nnoremap <leader>g :vertical G<CR>

" Diffs and files
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>

" Log
nnoremap <leader>gl :0Gclog<CR>

" Branches
nnoremap <leader>gc :vertical Gcommit<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gs :G switch 
nnoremap <leader>gu :Gpush<CR>
