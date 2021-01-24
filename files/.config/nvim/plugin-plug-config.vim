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
Plug 'https://github.com/AndrewRadev/splitjoin.vim' "Split/join multiline statements
Plug 'https://github.com/Yggdroot/indentLine' "Show vertical indentation lines
Plug 'https://github.com/airblade/vim-gitgutter.git' "Git gutter
Plug 'https://github.com/airblade/vim-rooter' "On open file look up for project root
Plug 'https://github.com/dhruvasagar/vim-zoom' " Zoom pane in/out
Plug 'https://github.com/mcchrish/nnn.vim' "NNN integration
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'} "Autocomplete engine and more
Plug 'https://github.com/rickhowe/diffchar.vim' "Highlight chars not lines when diffing
Plug 'https://github.com/sheerun/vim-polyglot' "All the languages syntax highlighting
Plug 'https://github.com/tpope/vim-commentary' "Commenting shortcuts
Plug 'https://github.com/tpope/vim-fugitive' "Git management
Plug 'https://tpope.io/vim/surround.git' "Better text surrounding patterns
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf binary
Plug 'junegunn/fzf.vim' "Fzf vim wrapper
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
