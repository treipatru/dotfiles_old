set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Load config files - order matters
source ~/.config/nvim/plugin-plug-config.vim
source ~/.vimrc
source ~/.config/nvim/plugin-coc-config.vim
source ~/.config/nvim/plugin-airline-config.vim
source ~/.config/nvim/plugin-rooter-config.vim
source ~/.config/nvim/plugin-fzf-config.vim
