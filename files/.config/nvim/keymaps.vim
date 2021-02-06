nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"

" Ctrl+l clears search term
nnoremap <silent> <leader>l :nohlsearch<CR><leader>l

" Coc - Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Copy to system clipboard
vnoremap <C-y> "+y

" Presentation mode via Goyo
nnoremap <silent> <leader>p :Goyo<CR>

" Remap scroll to smooth zoom
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" Splits
" ---------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>c <C-w>c
nnoremap <leader>o <C-w>o
nnoremap <silent> <Tab> <C-w>w

" Buffers
" ---------------------------------------------------------
" When deleting buffer render the previous one in the current split
nnoremap <silent> <leader>bd :lclose<bar>b#<bar>bd #<CR>
" Delete all buffers except current one
nnoremap <silent> <leader>bo :BufOnly<CR>

nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>

nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>

" Map buftabilne to alt+#
nmap <A-1> <Plug>BufTabLine.Go(1)
nmap <A-2> <Plug>BufTabLine.Go(2)
nmap <A-3> <Plug>BufTabLine.Go(3)
nmap <A-4> <Plug>BufTabLine.Go(4)
nmap <A-5> <Plug>BufTabLine.Go(5)
nmap <A-6> <Plug>BufTabLine.Go(6)
nmap <A-7> <Plug>BufTabLine.Go(7)
nmap <A-8> <Plug>BufTabLine.Go(8)
nmap <A-9> <Plug>BufTabLine.Go(9)
nmap <A-0> <Plug>BufTabLine.Go(10)

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
nnoremap <leader>fj <cmd>lua require('telescope.builtin').find_files()<cr>

" Grep all files in project
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" Jump to file in Vim History
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>

" Jump to file in Vim History
nnoremap <leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>

" Find in all project files using Ack
nnoremap <leader>/ <cmd>lua require('telescope.builtin').grep_string()<cr>

" Toggle explorer
nnoremap <silent> <leader>ff :Fern . -drawer -width=35 -toggle -reveal=%<CR>

" Find symbol in current file
nnoremap <leader>fs :CocList outline<CR>

" Find open buffers
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

" Coc - Find definition of selected symbol
nmap <silent> <leader>fd <Plug>(coc-definition)
" Coc - Find references of selected symbol
nmap <silent> <leader>fr <Plug>(coc-references)

" ---------------------------------------------------------
" Git integration
" Status
nnoremap <silent> <leader>gs :call ToggleGstatus()<CR>
" Open Diff
nnoremap <silent> <leader>gd :Gvdiffsplit!<CR>
" Apply diff Left pane
nnoremap <silent> <leader>gdh :diffget //2<CR>
" Apply diff Right pane
nnoremap <silent> <leader>gdl :diffget //3<CR>
" Reload contents of buffer from repository
nnoremap <leader>gr :Gread<CR>
" Save and stage file
nnoremap <leader>gw :Gwrite<CR>
" Show log of current file
nnoremap <silent> <leader>gl :0Gclog<CR>
" Commit staged files
nnoremap <silent> <leader>gc :call ToggleGCommit()<CR>
" Switch branch
nnoremap <leader>gb :G switch 

nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gu :Gpush<CR>
