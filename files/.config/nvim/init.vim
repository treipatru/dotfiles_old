source $HOME/.config/nvim/base.vim
source $HOME/.config/nvim/custom-func.vim
source $HOME/.config/nvim/keymaps.vim

" Plugins
source $HOME/.config/nvim/plugins-cfg/plug.vim

source $HOME/.config/nvim/plugins-cfg/ack.vim
source $HOME/.config/nvim/plugins-cfg/airline.vim
source $HOME/.config/nvim/plugins-cfg/coc.vim
source $HOME/.config/nvim/plugins-cfg/fern.vim
source $HOME/.config/nvim/plugins-cfg/fzf.vim
source $HOME/.config/nvim/plugins-cfg/rooter.vim

" NeoVim and/or post plugin settings
colorscheme onedark
let g:one_allow_italics = 1 "Italics for comments if possible
highlight Comment cterm=italic gui=italic
set background=dark "Use colors for dark background
set lcs=tab:»_,trail:·,eol:↵ "Display tabs, trailing whitespace and eol as...
