"PLUGIN MANAGER
"..................................................................................................
"Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

"Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.vimrc
\| endif

"Plugins list
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' } "Dracula theme
Plug 'https://github.com/Yggdroot/indentLine' "Show vertical indentation lines
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'} "Autocomplete engine and more
Plug 'https://github.com/sheerun/vim-polyglot' "All the language syntax highlighting
Plug 'https://github.com/tpope/vim-fugitive' "Git management
Plug 'https://tpope.io/vim/surround.git' "Better text surrounding patterns
call plug#end()

"INDENTATION
"..................................................................................................
set autoindent "New lines inherit indentation of previous line
set expandtab "Convert tab to spaces
set smarttab "Insert tabstop number of spaces when tab is pressed
set tabstop=4 "Tabs are now 4 spaces
set shiftwidth=4 "Shifting with > inserts 4 spaces

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

"VISUAL OPTIONS
"..................................................................................................
colorscheme dracula
set background=dark " Use colors for dark background
set cursorline "Highlight current line
set mouse=a "Enable mouse for scrolling and resizing
set number "Show line numbers
set relativenumber "Shoe relative line numbers
set ruler "Always show cursor positon
set scrolloff=2 "The number of lines to keep above and below the cursor
set sidescrolloff=5 "The number of columns to keep to the left and right of the cursor
set wrap "Enable line wrapping
syntax enable "Enable syntax highlighting

