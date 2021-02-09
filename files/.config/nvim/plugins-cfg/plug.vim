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
Plug 'christoomey/vim-sort-motion' "Sort motions
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete engine and more
Plug 'raimondi/delimitmate' "Auto close quotes, brackets
Plug 'unblevable/quick-scope' "Highlight unique chars when jumping with f/t
Plug 'vim-scripts/restore_view.vim' "Auto restore folds and positions

" Visual enhancements
Plug 'dhruvasagar/vim-zoom' "Allow zoom on a single split
Plug 'joshdick/onedark.vim' "Theme
Plug 'lambdalisue/nerdfont.vim' "Sweet icons
Plug 'mhinz/vim-signify' "Git gutter
Plug 'sheerun/vim-polyglot' "All the languages syntax highlighting
Plug 'yuttie/comfortable-motion.vim' "Smooth scrolling

" Junegunn
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf binary
Plug 'junegunn/fzf.vim' "Fzf vim wrapper
Plug 'junegunn/goyo.vim' "Distractionf free writing
Plug 'junegunn/limelight.vim' "Highlight current paragraph

" Tpope
Plug 'https://tpope.io/vim/surround.git' "Better text surrounding patterns
Plug 'tpope/vim-commentary' "Commenting shortcuts
Plug 'tpope/vim-fugitive' "Git management

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Fern
Plug 'lambdalisue/fern.vim'

Plug 'LumaKernel/fern-mapping-fzf.vim' "Map fd to fzf jump to folder
Plug 'lambdalisue/fern-git-status.vim' "Tree view
Plug 'lambdalisue/fern-hijack.vim' "Replace netrw with fern
Plug 'lambdalisue/fern-renderer-nerdfont.vim' "Plug icons

"Text objects
Plug 'kana/vim-textobj-user' "Support for user defined text objects

Plug 'kana/vim-textobj-indent' "same indend block text obj like
Plug 'rhysd/vim-textobj-anyblock' "any block text obj like ([{'>

call plug#end()
