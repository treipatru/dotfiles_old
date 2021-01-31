nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"

" Ctrl+l clears search term
nnoremap <silent> <leader>l :nohlsearch<CR><leader>l

" Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>c <C-w>c
nnoremap <leader>w <C-w>w
nnoremap <leader>o <C-w>o
nnoremap <leader>o <C-w>o

" Quickfix list
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" Buffers
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bw :w<CR>

" Fugitive - Status
nnoremap <leader>g :vertical G<CR>

" Fugitive - Diffs and files
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>

" Fugitive - Log
nnoremap <leader>gl :0Gclog<CR>

" Fugitive - Branches
nnoremap <leader>gc :vertical Gcommit<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gs :G switch 
nnoremap <leader>gu :Gpush<CR>

" Ack - Maps <leader>/ to search
nnoremap <Leader>/ :Ack!<Space>

" Zoom - Maximize/Minimize current split
nmap <leader>m <Plug>(zoom-toggle)

" Coc - GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc - Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Coc - Jump diagnostics
nmap ]g <Plug>(coc-diagnostic-next)
nmap [g <Plug>(coc-diagnostic-prev)

" Coc - Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" FZF - Grep in project
nnoremap <silent> <leader>fg :Rg<CR>

" FZF - Find in Vim history
nnoremap <silent> <leader>fh :History<CR>

" FZF - Find in priject
nnoremap <silent> <leader>fj :Files<CR>

nmap ]c <Plug>(signify-next-hunk):SignifyHunkDiff<CR>
nmap  [c <Plug>(signify-prev-hunk):SignifyHunkDiff<CR>
