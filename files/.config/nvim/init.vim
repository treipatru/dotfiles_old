" Base
" ---------------------------------------------------------
source $HOME/.config/nvim/base.vim "Shared with vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/keymaps.vim

set foldtext=CodeFolder()
set inccommand=split "Live substitute preview
set lcs=tab:»_,trail:·,eol:↵ "Display tabs, trailing whitespace and eol
set list

" Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim

" Hide cursorline in active splits
augroup stuff
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
    autocmd InsertEnter * set nolist
    autocmd InsertLeave * set list
augroup END


" Plugins
" ---------------------------------------------------------
source $HOME/.config/nvim/plugins-cfg/plug.vim

source $HOME/.config/nvim/plugins-cfg/coc.vim
source $HOME/.config/nvim/plugins-cfg/quickscope.vim
source $HOME/.config/nvim/plugins-cfg/rooter.vim

" Lua plugins
lua require('plugins.cfg-galaxyline')
lua require('plugins.cfg-telescope')
" Plugin settings
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
let g:leaderGuide_display_plus_menus = 1
let g:bufferline_active_buffer_left = '[ '
let g:bufferline_active_buffer_right = ']'
let g:bufferline_show_bufnr = 0
let g:floaterm_opener = 'vsplit'
let g:qf_shorten_path = 3


" Theme
" ---------------------------------------------------------
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
colorscheme material

highlight CursorLine cterm=NONE guibg=#223d6b
highlight DiffAdd guibg=#365e2e guifg=#FFFFFF
highlight DiffDelete guibg=#4b1818 guifg=#FFFFFF
hi Normal guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE

hi Floaterm guibg=#263238
hi FloatermBorder guibg=#263238 guifg=#eeffff
