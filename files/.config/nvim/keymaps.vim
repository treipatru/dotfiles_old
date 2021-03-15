" Vim basics
" ---------------------------------------------------------
nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"
" Define vim leader guide dictionary
let g:lmap = {}

nnoremap <silent> <leader>v <C-w>v
let g:lmap.v = 'new vertical split'
nnoremap <silent> <leader>s <C-w>s
let g:lmap.s = 'new horizontal split'
nnoremap <silent> <leader>c <C-w>c
let g:lmap.c = 'close active split'
nnoremap <silent> <leader>o <C-w>o
let g:lmap.o = 'close all splits except active one'
nnoremap <silent> <Tab>     <C-w>w

nnoremap <silent> <leader>l :nohlsearch<CR><leader>l
let g:lmap.l = 'clear buffer search'
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
let g:lmap.f = {'name' : 'find'}

nnoremap <leader>fj <cmd>lua require('telescope.builtin').find_files()<cr>
let g:lmap.f.j = 'file in project'

nnoremap <silent> <leader>ft <cmd>:FloatermNew broot<cr>
let g:lmap.f.t = 'file in project tree'

nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
let g:lmap.f.g = 'string in project'

nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>
let g:lmap.f.h = 'file in history'

nnoremap <leader>fw :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:lmap.f.w = 'word in project file in history'

nnoremap <silent> <leader>ff :FloatermNew ranger<CR>
let g:lmap.f.f = 'file via file explorer'

nnoremap <leader>fs :CocList outline<CR>
let g:lmap.f.s = 'symbol in buffer'

nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
let g:lmap.f.b = 'buffers'

nmap <silent> <leader>fd <Plug>(coc-definition)
let g:lmap.f.d = 'word definition in project'

nmap <silent> <leader>fr <Plug>(coc-references)
let g:lmap.f.r = 'word references in project'

nnoremap <leader>fc <cmd>lua require('telescope.builtin').command_history()<cr>
let g:lmap.f.c = 'commands in vim history'

" ---------------------------------------------------------
" Git integration
let g:lmap.g = {'name' : 'git'}

nnoremap <silent> <leader>gs :call ToggleGstatus()<CR>
let g:lmap.g.s = 'status'

nnoremap <leader>gr :Gread<CR>
let g:lmap.g.r = 'read current file'

nnoremap <leader>gw :Gwrite<CR>
let g:lmap.g.w = 'save and write'

nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_bcommits()<cr>
let g:lmap.g.l = 'show branch commits'

nnoremap <silent> <leader>gc :call ToggleGCommit()<CR>
let g:lmap.g.c = 'commit staged files'

nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
let g:lmap.g.b = 'branch'

nnoremap <leader>gp :Git pull<CR>
let g:lmap.g.p = 'pull'

nnoremap <leader>gu :Git push<CR>
let g:lmap.g.a = 'push'

" Diffing
let g:lmap.g.d = {'name' : 'diff'}
" Toggle diff
nnoremap <silent> <leader>gdd :set diff!<CR>
let g:lmap.g.d.d = 'set diff in active buffer'
" Apply diff Left pane
nnoremap <silent> <leader>gdh :diffget //2<CR>
let g:lmap.g.d.h = 'get change from left (ours)'
" Apply diff Right pane
nnoremap <silent> <leader>gdl :diffget //3<CR>
let g:lmap.g.d.l = 'get change from right (theirs)'


" Various plugin shortcuts
" ---------------------------------------------------------
" Toggle undo tree plugin
nnoremap <silent> <leader>u :UndotreeToggle<CR>
let g:lmap.t = 'toggle undo tree'
" Toggle quickfix list via vim-qf
nmap <leader>q <Plug>(qf_qf_toggle_stay)
let g:lmap.t = 'toggle quickfix list'
" Zoom - Maximize/Minimize current split
nmap <leader>m <Plug>(zoom-toggle)
let g:lmap.z = 'toggle split zoom'
" Make mouse scroll use Comfortable Motion plugin
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" Bufkil - close buffer without closing split
nnoremap <silent> <leader>bd :BUN<CR>
" Toggle terminal
nnoremap   <silent>   <leader>t   :FloatermToggle<CR>
let g:lmap.t = 'toggle terminal'
tnoremap   <silent>   <leader>t   <C-\><C-n>:FloatermToggle<CR>


" LeaderGuide config
" ---------------------------------------------------------
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
