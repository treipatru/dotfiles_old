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
set autoread "Automatically re-read files if unmodified inside Vim 
set timeoutlen=1000 "Leader timeout
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

colorscheme dracula
let g:dracula_colorterm = 1 "Set transparent background
set background=dark "Use colors for dark background
let g:one_allow_italics = 1 "Italics for comments if possible
set cursorline "Highlight current line
set mouse=a "Enable mouse for scrolling and resizing
set noshowmode "Disable mode since it's handled by airline
set number "Show line numbers
set relativenumber "Shoe relative line numbers
set ruler "Always show cursor positon
set scrolloff=2 "The number of lines to keep above and below the cursor
set sidescrolloff=5 "The number of columns to keep to the left and right of the cursor
set nowrap "Enable line wrapping
syntax enable "Enable syntax highlighting


"KEY BINDINGS
"..................................................................................................
let mapleader=","

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

" Open NNN 
let g:nnn#layout = { 'window': { 'width': 0.4, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#command = 'nnn -doe'
nnoremap <silent> <leader>n :Nnnpicker %<CR>

"Close buffer
nnoremap <leader>d :bdelete<CR>
