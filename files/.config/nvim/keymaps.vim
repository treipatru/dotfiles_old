nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"

" Ctrl+l clears search term
nnoremap <silent> <leader>l :nohlsearch<CR><leader>l

" Zoom - Maximize/Minimize current split
nmap <leader>m <Plug>(zoom-toggle)

" Coc - Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Copy to system clipboard
vnoremap <C-y> "+y

" Splits
" ---------------------------------------------------------
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

" Buffers
" ---------------------------------------------------------
" When deleting buffer render the previous one in the current split
nnoremap <leader>bd :lclose<bar>b#<bar>bd #<CR>
" Delete all buffers except current one
nnoremap <leader>bo :BufOnly<CR>

nnoremap <leader>bn :bnext<CR>
nnoremap <silent> <Tab> :bnext<CR>

nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bw :w<CR>

" Brackets jumping
" ---------------------------------------------------------
" Quicklist
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" Coc - Diagnostics
nmap ]g <Plug>(coc-diagnostic-next)
nmap [g <Plug>(coc-diagnostic-prev)

" Signify - Git file changes
nmap ]c <Plug>(signify-next-hunk):SignifyHunkDiff<CR>
nmap  [c <Plug>(signify-prev-hunk):SignifyHunkDiff<CR>

" Finding resources
" ---------------------------------------------------------
" Jump to file in project
nnoremap <silent> <leader>fj :Files<CR>
" Grep all files in project
nnoremap <silent> <leader>fg :Rg<CR>
" Jump to file in Vim History
nnoremap <silent> <leader>fh :History<CR>
" Find in all project files using Ack
nnoremap <leader>/ :Ack!<Space>
" Toggle explorer
nnoremap <silent> <leader>ff :Fern . -drawer -width=35 -toggle -reveal=%<CR>
" Find symbol in current file
nnoremap <leader>fs :CocList outline<CR>
" Find open buffers
nnoremap <leader>fb :Buffers<CR>
" Coc - Find definition of selected symbol
nmap <silent> <leader>fd <Plug>(coc-definition)
" Coc - Find references of selected symbol
nmap <silent> <leader>fr <Plug>(coc-references)

" Git integration
" ---------------------------------------------------------
" Status
nnoremap <leader>gs :vertical G<CR>
" Open Diff
nnoremap <leader>gd :Gvdiffsplit!<CR>
" Apply diff Left pane
nnoremap <leader>gdh :diffget //2<CR>
" Apply diff Right pane
nnoremap <leader>gdl :diffget //3<CR>
" Reload contents of buffer from repository
nnoremap <leader>gr :Gread<CR>
" Save and stage file
nnoremap <leader>gw :Gwrite<CR>
" Show log of current file
nnoremap <leader>gl :0Gclog<CR>
" Commit staged files
nnoremap <leader>gc :vertical Gcommit<CR>
" Switch branch
nnoremap <leader>gb :G switch 

nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gu :Gpush<CR>
