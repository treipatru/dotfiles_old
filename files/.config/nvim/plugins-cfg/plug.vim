set rtp +=~/.vim

"Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.vimrc
\| endif

"General plugins
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim' "Split/join multiline statements
Plug 'airblade/vim-rooter' "On open file look up for project root
Plug 'blueyed/vim-diminactive' "Highlight active splits
Plug 'christoomey/vim-sort-motion' "Sort motions
Plug 'https://tpope.io/vim/surround.git' "Better text surrounding patterns
Plug 'joshdick/onedark.vim' "Theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf binary
Plug 'junegunn/fzf.vim' "Fzf vim wrapper
Plug 'junegunn/goyo.vim' "Distractionf free writing
Plug 'junegunn/limelight.vim' "Highlight current paragraph
Plug 'lambdalisue/nerdfont.vim' "Sweet icons
Plug 'mhinz/vim-signify' "Git gutter
Plug 'mileszs/ack.vim' "Ack ack, ack ack!
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete engine and more
Plug 'raimondi/delimitmate' "Auto close quotes, brackets
Plug 'sheerun/vim-polyglot' "All the languages syntax highlighting
Plug 'tpope/vim-commentary' "Commenting shortcuts
Plug 'tpope/vim-fugitive' "Git management
Plug 'vim-airline/vim-airline' "Airline
Plug 'vim-airline/vim-airline-themes' "Airline themes
Plug 'vim-scripts/restore_view.vim' "Auto restore folds and positions
Plug 'yuttie/comfortable-motion.vim' "Smooth scrolling

"Fern
Plug 'LumaKernel/fern-mapping-fzf.vim' "Map fd to fzf jump to folder
Plug 'lambdalisue/fern-git-status.vim' "Tree view
Plug 'lambdalisue/fern-renderer-nerdfont.vim' "Plug icons
Plug 'lambdalisue/fern.vim' "Tree view

"Text objects
Plug 'kana/vim-textobj-function' "function text obj
Plug 'kana/vim-textobj-indent' "same indend block text obj like
Plug 'kana/vim-textobj-user' "Support for user defined text objects
Plug 'rhysd/vim-textobj-anyblock' "any block text obj like ([{'>
Plug 'thinca/vim-textobj-function-javascript' "js function text obj

call plug#end()
