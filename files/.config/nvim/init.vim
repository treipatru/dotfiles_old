" BASE CONFIG SHARED WITH VIM
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/base.vim

" EXTRA FUNCTIONALITY
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/functions.vim
" Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim

" Toggle dispay whitespace
:autocmd InsertEnter,InsertLeave * set list!

" Hide cursorline in active splits
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
    " autocmd VimEnter * call ConfigStatusLine()
augroup END

" PLUGINS
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/plugins-cfg/plug.vim

source $HOME/.config/nvim/plugins-cfg/coc.vim
source $HOME/.config/nvim/plugins-cfg/quickscope.vim
source $HOME/.config/nvim/plugins-cfg/rooter.vim

lua require('plugins.cfg-galaxyline')
lua require('plugins.cfg-telescope')

let g:bufferline_show_bufnr = 0
let g:bufferline_excludes = []

let g:floaterm_opener = 'edit'

let g:qf_shorten_path = 3

" Post plugin load settings (Order matters)
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
set list "Show whitespace
set foldtext=CodeFolder()
set inccommand=split "Live substitute preview
set lcs=tab:»_,trail:·,eol:↵ "Display tabs, trailing whitespace and eol

colorscheme onedark
set background=dark
highlight Comment cterm=italic gui=italic "Italic comments
highlight CursorLine cterm=NONE guibg=#223d6b "More visible cursor line
highlight DiffAdd guibg=#41492d
highlight DiffDelete guifg=#4b1818 guibg=#4b1818
hi Normal guibg=NONE ctermbg=NONE
