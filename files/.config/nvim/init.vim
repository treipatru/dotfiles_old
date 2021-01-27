" Base setup
"..................................................................................................
" Common basic settings with Vim
source $HOME/.config/nvim/base.vim

let g:one_allow_italics = 1 "Italics for comments if possible
set lcs=tab:»_,trail:·,eol:$ "Display tabs, trailing whitespace and eol as...
set list "Show whitespace
set noshowmode "Disable mode since it's handled by airline

" Code folding
set foldmethod=syntax "Syntax highlighting items specify folds
set foldcolumn=1 "Defines 1 col at window left, to indicate folding
let javaScript_fold=1 "Activate folding by JS syntax
set foldlevelstart=99 "Start file with all folds opened

" Keymaps
"..................................................................................................
nnoremap <SPACE> <Nop>
let mapleader=" "

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

" Ctrl+l clears search term
nnoremap <silent> <leader>l :nohlsearch<CR><leader>l

" Buffers
command! BufOnly silent! execute "%bd|e#|bd#" "Delete all buffers except the current one
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bw :w<CR>

" Quickfix list
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" Plugins
"..................................................................................................
source $HOME/.config/nvim/cfg-plug.vim

colorscheme dracula
let g:dracula_colorterm = 0 "Set transparent background
set background=dark "Use colors for dark background

source $HOME/.config/nvim/cfg-ack.vim
source $HOME/.config/nvim/cfg-airline.vim
source $HOME/.config/nvim/cfg-coc.vim
source $HOME/.config/nvim/cfg-fern.vim 
source $HOME/.config/nvim/cfg-fugitive.vim
source $HOME/.config/nvim/cfg-fzf.vim
source $HOME/.config/nvim/cfg-gitgutter.vim
source $HOME/.config/nvim/cfg-rooter.vim
source $HOME/.config/nvim/cfg-zoom.vim

" The rest
"..................................................................................................
runtime macros/matchit.vim "Enable matchit(ex. use % to jump between html tags)

source $HOME/.config/nvim/./cfg-autocmd.vim
