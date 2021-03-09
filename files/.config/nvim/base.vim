if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

let g:netrw_banner=0 "Hide banner
let g:netrw_browse_split=4 "Open file in previous window
let g:netrw_liststyle=3 "Display file list as tree
let g:netrw_winsize=20 "Width of netrw split
let javaScript_fold=1 "Activate folding by JS syntax

set autoindent "New lines inherit indentation of previous line
set autoread "Automatically re-read files if unmodified inside Vim
set cmdheight=1 "Command height
set cursorline "Highlight current line
set encoding=UTF-8
set expandtab "Convert tab to spaces
set foldcolumn=0 "Toggle displaying folding level in separate gutter column
set foldlevelstart=99 "Start file with all folds opened
set foldmethod=syntax "Syntax highlighting items specify folds
set hidden "CoC recommended
set hlsearch "Enable search highlighting
set ignorecase "Ignore case when searching
set incsearch "Incremental search that shows partial matches
set mouse=a "Enable mouse for scrolling and resizing
set nobackup "CoC recommended
set noshowmode "Disable mode since it's handled by airline
set nowrap "Disable line wrapping
set nowritebackup "CoC recommended
set number "Show line numbers
set pumheight=10 "Popup menu size
set relativenumber "Show relative line numbers
set ruler "Always show cursor positon
set scrolloff=10 "The number of lines to keep above and below the cursor
set shiftwidth=4 "Shifting with > inserts 4 spaces
set sidescrolloff=20 "The number of columns to keep to the left and right of the cursor
set smartcase "Automatically switch search to case-sensitive when query contains an uppercase letter
set smarttab "Insert tabstop number of spaces when tab is pressed
set splitbelow "Automatic h split to bottom
set splitright "Automatic v split to right
set switchbuf="useopen" "Switch to window if buffer already open
set tabstop=4 "Tabs are now 4 spaces
set timeoutlen=500 "Leader timeout
set updatetime=100 "Refresh rate
syntax enable "Enable syntax highlighting
