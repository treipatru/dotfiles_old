"INDENTATION
"..................................................................................................
set autoindent "New lines inherit indentation of previous line
set expandtab "Convert tab to spaces
set shiftwidth=4 "Shifting with > inserts 4 spaces
set smarttab "Insert tabstop number of spaces when tab is pressed
set tabstop=4 "Tabs are now 4 spaces

"NETRW
"..................................................................................................
let g:netrw_banner=0 "Hide banner
let g:netrw_browse_split=4 "Open file in previous window
let g:netrw_liststyle=3 "Display file list as tree
let g:netrw_winsize=20 "Width of netrw split

"SEARCHING
"..................................................................................................
set hlsearch "Enable search highlighting
set ignorecase "Ignore case when searching
set incsearch "Incremental search that shows partial matches
set smartcase "Automatically switch search to case-sensitive when query contains an uppercase letter

"OTHER OPTIONS
"..................................................................................................
let g:fern_git_status#disable_ignored = 1
set autoread "Automatically re-read files if unmodified inside Vim
set timeoutlen=750 "Leader timeout
set updatetime=100 "Refresh rate

"VISUAL OPTIONS
"..................................................................................................
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

:autocmd InsertEnter,InsertLeave * set list! "Toggle display whitespace when switching Insert mode
colorscheme dracula
let g:dracula_colorterm = 0 "Set transparent background
let g:one_allow_italics = 1 "Italics for comments if possible
set background=dark "Use colors for dark background
set cursorline "Highlight current line
set lcs=tab:»_,trail:·,eol:$ "Display tabs, trailing whitespace and eol as...
set list "Show whitespace
set mouse=a "Enable mouse for scrolling and resizing
set noshowmode "Disable mode since it's handled by airline
set nowrap "Enable line wrapping
set number "Show line numbers
set relativenumber "Shoe relative line numbers
set ruler "Always show cursor positon
set scrolloff=10 "The number of lines to keep above and below the cursor
set sidescrolloff=8 "The number of columns to keep to the left and right of the cursor
syntax enable "Enable syntax highlighting

"KEY BINDINGS
"..................................................................................................
nnoremap <SPACE> <Nop>
let mapleader=" "

"Tab navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>c <C-w>c
nnoremap <leader>w <C-w>w
nnoremap <leader>o <C-w>o

" Toggle zoom plugin
nmap <leader>m <Plug>(zoom-toggle)

"Ctrl+l clears search term
nnoremap <silent> <leader>l :nohlsearch<CR><leader>l

"Buffers
" Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bw :w<CR>

"Git/Fugitive binds
nnoremap <leader>g :vertical G<CR>
nnoremap <leader>gc :vertical Gcommit<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
nnoremap <leader>gs :G switch 
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gu :Gpush<CR>
nnoremap <leader>gw :Gwrite<CR>

"GitGitter binds
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"CoC binds
nmap ]g <Plug>(coc-diagnostic-next)
nmap [g <Plug>(coc-diagnostic-prev)
nmap <leader>rn <Plug>(coc-rename)

"Files management
nnoremap <silent> <leader>f :Fern . -drawer -width=40 -toggle -reveal=%<CR>
nnoremap <silent> <leader>fg :Rg<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fj :Files<CR>

"Enable matchit macro (ex. use % to jump between html tags)
runtime macros/matchit.vim

"Code folding
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
