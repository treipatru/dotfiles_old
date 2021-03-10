" Vim basics
" ---------------------------------------------------------
nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"

nnoremap <silent> <leader>v <C-w>v
nnoremap <silent> <leader>s <C-w>s
nnoremap <silent> <leader>c <C-w>c
nnoremap <silent> <leader>o <C-w>o
nnoremap <silent> <Tab>     <C-w>w

" Clear search term
nnoremap <silent> <leader>l :nohlsearch<CR><leader>l
" Copy to system clipboard
vnoremap <C-y> "+y
" Delete all buffers except the current one
nnoremap <silent> <leader>bo :<c-u>up <bar> %bd <bar> e#<cr>


" Brackets navigation
" ---------------------------------------------------------
" Coc - Diagnostics
nmap ]g <Plug>(coc-diagnostic-next)
nmap [g <Plug>(coc-diagnostic-prev)
" Signify - modified hunk navigation
nmap ]h <Plug>(signify-next-hunk):SignifyHunkDiff<CR>
nmap [h <Plug>(signify-prev-hunk):SignifyHunkDiff<CR>
" Quickfix list navigation
nmap ]q <Plug>(qf_qf_next)
nmap [q <Plug>(qf_qf_previous)
" Buffers
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>


" Finding resources
" ---------------------------------------------------------
" Files in project
nnoremap <silent> <leader>fj <cmd>:FloatermNew broot<cr>
" Grep in project
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" Files in global file history
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>
" Cocsearch current word in project
nnoremap <leader>/ :CocSearch <C-R>=expand("<cword>")<CR><CR>
" File via ranger explorer
nnoremap <silent> <leader>ff :FloatermNew ranger<CR>
" Current file symbols
nnoremap <leader>fs :CocList outline<CR>
" Open buffers
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" Coc - Find definition of selected symbol
nmap <silent> <leader>fd <Plug>(coc-definition)
" Coc - Find references of selected symbol
nmap <silent> <leader>fr <Plug>(coc-references)
" Previous vim commands
nnoremap <leader>fc <cmd>lua require('telescope.builtin').command_history()<cr>

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
nnoremap <leader>gp :Git pull<CR>
nnoremap <leader>gu :Git push<CR>


" Various plugin shortcuts
" ---------------------------------------------------------
" Toggle undo tree plugin
nnoremap <silent> <leader>u :UndotreeToggle<CR>
" Toggle quickfix list via vim-qf
nmap <leader>q <Plug>(qf_qf_toggle_stay)
" Zoom - Maximize/Minimize current split
nmap <leader>m <Plug>(zoom-toggle)
" Make mouse scroll use Comfortable Motion plugin
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" Coc - Rename symbol
nmap <leader>rn <Plug>(coc-rename)
" Bufkil - close buffer without closing split
nnoremap <silent> <leader>bd :BUN<CR>
" Toggle terminal
nnoremap   <silent>   <leader>t   :FloatermToggle<CR>
tnoremap   <silent>   <leader>t   <C-\><C-n>:FloatermToggle<CR>
