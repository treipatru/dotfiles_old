" No vi compatibility
set nocompatible

" Install plug package manager if not available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Start plug plugin manager
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'posva/vim-vue'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
call plug#end()
" End plug

" NERDTree Config
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Close if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Other options
syntax enable
set tabstop=4
set softtabstop=4
set expandtab
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set showmatch
set incsearch
set hlsearch
set laststatus=2

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NETRW Config
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Colors
colorscheme gruvbox
set background=dark    " Setting dark mode
