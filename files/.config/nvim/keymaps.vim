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

" Toggle undo tree plugin
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Zoom - Maximize/Minimize current split
nmap <leader>m <Plug>(zoom-toggle)

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

nnoremap <silent> <A-1> :lua require"bufferline".go_to_buffer(1)<CR>
nnoremap <silent> <A-2> :lua require"bufferline".go_to_buffer(2)<CR>
nnoremap <silent> <A-3> :lua require"bufferline".go_to_buffer(3)<CR>
nnoremap <silent> <A-4> :lua require"bufferline".go_to_buffer(4)<CR>
nnoremap <silent> <A-5> :lua require"bufferline".go_to_buffer(5)<CR>
nnoremap <silent> <A-6> :lua require"bufferline".go_to_buffer(6)<CR>
nnoremap <silent> <A-7> :lua require"bufferline".go_to_buffer(7)<CR>
nnoremap <silent> <A-8> :lua require"bufferline".go_to_buffer(8)<CR>
nnoremap <silent> <A-9> :lua require"bufferline".go_to_buffer(9)<CR>

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
" nnoremap <leader>fj <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <leader>fj <cmd>:FloatermNew broot<cr>

" Grep all files in project
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" Jump to file in Vim History
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>

" Jump to file in Vim History
nnoremap <leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>

" Find in all project files
nnoremap <leader>/ :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Toggle explorer
" nnoremap <silent> <leader>ff :Fern . -drawer -width=35 -toggle -reveal=%<CR>
nnoremap <silent> <leader>ff :FloatermNew ranger<CR>

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
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_bcommits()<cr>

" Commit staged files
nnoremap <silent> <leader>gc :call ToggleGCommit()<CR>

" Switch branch
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
" nnoremap <leader>gb :G switch 

nnoremap <leader>gp :Git pull<CR>
nnoremap <leader>gu :Git push<CR>

" Open terminal
nnoremap   <silent>   <leader>t   :FloatermToggle<CR>
tnoremap   <silent>   <leader>t   <C-\><C-n>:FloatermToggle<CR>
