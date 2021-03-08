" BASE CONFIG SHARED WITH VIM
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/base.vim

" EXTRA FUNCTIONALITY
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/functions.vim
" Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim
" Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"

set foldtext=CodeFolder()
set inccommand=split "Live substitute preview
set lcs=tab:»_,trail:·,eol:↵ "Display tabs, trailing whitespace and eol as...

" Toggle dispay whitespace
:autocmd InsertEnter,InsertLeave * set list!

" Hide cursorline in active splits
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
    autocmd VimEnter * call ConfigStatusLine()
augroup END

" PLUGINS
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/plugins-cfg/plug.vim

source $HOME/.config/nvim/plugins-cfg/coc.vim
source $HOME/.config/nvim/plugins-cfg/quickscope.vim
source $HOME/.config/nvim/plugins-cfg/rooter.vim

lua require('plugins.cfg-galaxyline')
lua require('plugins.cfg-telescope')

function! ConfigStatusLine()
  lua require('plugins.cfg-bufferline')
endfunction


" Post plugin load settings (Order matters)
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
colorscheme onedark
set background=dark
highlight Comment cterm=italic gui=italic "Italic comments
highlight CursorLine cterm=NONE guibg=#223d6b "More visible cursor line
highlight DiffAdd guibg=#41492d
highlight DiffDelete guifg=#4b1818 guibg=#4b1818
hi Normal guibg=NONE ctermbg=NONE
