"INDENTATION
set autoindent "New lines inherit indentation of previous line
set expandtab "Convert tab to spaces
set smarttab "Insert tabstop number of spaces when tab is pressed

"NETRW
let g:netrw_banner=0 "Hide banner
let g:netrw_browse_split=4 "Open file in previous window
let g:netrw_liststyle=3 "Display file list as tree
let g:netrw_winsize=30 "Width of netrw split

"SEARCHING
set hlsearch "Enable search highlighting
set ignorecase "Ignore case when searching
set incsearch "Incremental search that shows partial matches
set smartcase "Automatically switch search to case-sensitive when query contains an uppercase letter 

"OTHER OPTIONS
set autoread "Automatically re-read files if unmodified inside Vim 

"VISUAL OPTIONS
set background=dark " Use colors for dark background
set cursorline "Highlight current line
set mouse=a "Enable mouse for scrolling and resizing
set number "Show line numbers
set relativenumber "Shoe relative line numbers
set scrolloff=2 "The number of lines to keep above and below the cursor
set sidescrolloff=5 "The number of columns to keep to the left and right of the cursor
set ruler "Always show cursor positon
set wrap "Enable line wrapping
syntax enable "Enable syntax highlighting
