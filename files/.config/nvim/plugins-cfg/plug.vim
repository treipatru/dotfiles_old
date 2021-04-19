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
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'mbbill/undotree' "Undo tree visualizer
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete engine and more
Plug 'qpkorr/vim-bufkill' " Close buffer without closing split
Plug 'raimondi/delimitmate' "Auto close quotes, brackets
Plug 'romainl/vim-qf' "Quickfix enhancements
Plug 'spinks/vim-leader-guide' "Show leader guide keys
Plug 'unblevable/quick-scope' "Highlight unique chars when jumping with f/t
Plug 'vim-scripts/restore_view.vim' "Auto restore folds and positions
Plug 'voldikss/vim-floaterm' "Floating terminal

" Git
Plug 'AndrewRadev/linediff.vim' "Diff any lines
Plug 'rhysd/conflict-marker.vim' "Highlight chars instead of lines in diff
Plug 'rickhowe/diffchar.vim' "Highlight chars instead of lines in diff
Plug 'tpope/vim-commentary' "Commenting shortcuts
Plug 'tpope/vim-fugitive' "Git management
Plug 'tpope/vim-surround' "Better text surrounding patterns

" Visual enhancements
Plug 'christianchiarulli/nvcode-color-schemes.vim' " Theme w/ treesitter support
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'} "Galaxyline status
Plug 'mhinz/vim-signify' "Git gutter
Plug 'sheerun/vim-polyglot' "All the languages syntax highlighting

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"Text objects
Plug 'kana/vim-textobj-user' "Support for user defined text objects
Plug 'kana/vim-textobj-indent' "same indend block text obj like
Plug 'rhysd/vim-textobj-anyblock' "any block text obj like ([{'>

call plug#end()
