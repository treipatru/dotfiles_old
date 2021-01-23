"PLUGIN MANAGER
"..................................................................................................
"Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.vimrc
\| endif

call plug#begin('~/.vim/plugged')
"General plugins
Plug 'dracula/vim', { 'as': 'dracula' } "Dracula theme
Plug 'https://github.com/Yggdroot/indentLine' "Show vertical indentation lines
Plug 'https://github.com/airblade/vim-gitgutter.git' "Git gutter
Plug 'https://github.com/ctrlpvim/ctrlp.vim' "CtrlP file finder
Plug 'https://github.com/dhruvasagar/vim-zoom' " Zoom pane in/out
Plug 'https://github.com/mcchrish/nnn.vim' "NNN integration
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'} "Autocomplete engine and more
Plug 'https://github.com/rhysd/conflict-marker.vim' "Git conflict markers 
Plug 'https://github.com/rickhowe/diffchar.vim' "Highlight chars not lines when diffing
Plug 'https://github.com/sheerun/vim-polyglot' "All the languages syntax highlighting
Plug 'https://github.com/tpope/vim-commentary' "Commenting shortcuts
Plug 'https://github.com/tpope/vim-fugitive' "Git management
Plug 'https://github.com/voldikss/vim-floaterm' "Floating terminal support
Plug 'https://tpope.io/vim/surround.git' "Better text surrounding patterns
Plug 'vim-airline/vim-airline' "Airline
Plug 'vim-airline/vim-airline-themes' "Airline themes
"Text objects
Plug 'https://github.com/inside/vim-textobj-jsxattr' "jsx text obj
Plug 'https://github.com/kana/vim-textobj-function' "function text obj
Plug 'https://github.com/kana/vim-textobj-indent' "same indend block text obj like
Plug 'https://github.com/kana/vim-textobj-user' "Support for user defined text objects
Plug 'https://github.com/rhysd/vim-textobj-anyblock' "any block text obj like ([{'>
Plug 'thinca/vim-textobj-function-javascript' "js function text obj
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
set updatetime=100 "Refresh rate
set timeoutlen=1000 "Leader timeout
let g:ctrlp_custom_ignore = 'node_modules\|coverage\|dist\|git'

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
set background=dark " Use colors for dark background
let g:one_allow_italics = 1 " I love italic for comments
set cursorline "Highlight current line
set mouse=a "Enable mouse for scrolling and resizing
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
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>c <C-w>c
nnoremap <leader>w <C-w>w
nnoremap <leader>o <C-w>o

" Toggle zoom plugin
nmap <leader>m <Plug>(zoom-toggle)

"Ctrl+l clears search term
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Open floating nnn
nnoremap <leader>n :FloatermNew nnn<CR>

"AIRLINE
"..................................................................................................
"Config
let g:airline#extensions#tabline#enabled = 1 "Show buffers/tabs line
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

"Map buffers to Alt+#
nmap <m-1> <Plug>AirlineSelectTab1
nmap <m-2> <Plug>AirlineSelectTab2
nmap <m-3> <Plug>AirlineSelectTab3
nmap <m-4> <Plug>AirlineSelectTab4
nmap <m-5> <Plug>AirlineSelectTab5
nmap <m-6> <Plug>AirlineSelectTab6
nmap <m-7> <Plug>AirlineSelectTab7
nmap <m-8> <Plug>AirlineSelectTab8
nmap <m-9> <Plug>AirlineSelectTab9
nmap <m-0> <Plug>AirlineSelectTab0


"COC CONFIG
"..................................................................................................
autocmd CursorHold * silent call CocActionAsync('highlight')

"Auto install these coc extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" FZF File History
nnoremap <silent> <C-h> :History<CR>
