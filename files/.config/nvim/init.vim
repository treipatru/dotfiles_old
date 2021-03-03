" BASE CONFIG SHARED WITH VIM
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/base.vim

" PLUGINS
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
" Load plugins
source $HOME/.config/nvim/plugins-cfg/plug.vim

" VIM plugins cfg
source $HOME/.config/nvim/plugins-cfg/coc.vim
source $HOME/.config/nvim/plugins-cfg/fern.vim
source $HOME/.config/nvim/plugins-cfg/fzf.vim
source $HOME/.config/nvim/plugins-cfg/goyo.vim
source $HOME/.config/nvim/plugins-cfg/quickscope.vim
source $HOME/.config/nvim/plugins-cfg/rooter.vim

" LUA plugins cfg
lua require('plugins.cfg-galaxyline')

function! ConfigStatusLine()
  lua require('plugins.cfg-bufferline')
endfunction

" EXTRA FUNCTIONALITY
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
" Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim

" Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"

" Toggle Git Fugitive Status considering itself and open commit message
function ToggleGstatus() abort
    let commitbuff = bufwinnr('.git/COMMIT_EDITMSG')
    let statusbuff = bufwinnr('.git/index')

    if commitbuff > 0
        execute commitbuff.'close'
        vertical G
    elseif statusbuff > 0
        execute statusbuff.'close'
    else
        vertical G
    endif
endfunction

" Toggle Git Fugitive Status considering itself and open status
function ToggleGCommit() abort
    let commitbuff = bufwinnr('.git/COMMIT_EDITMSG')
    let statusbuff = bufwinnr('.git/index')

    if statusbuff > 0
        execute statusbuff.'close'
        vertical Git commit
    elseif commitbuff > 0
        execute commitbuff.'close'
    else
        vertical Git commit
    endif
endfunction

" Configure the text displayed for a closed fold
" Configure the text displayed for a closed fold
function! MyFoldText()
    " Get the line where the fold starts
    let line = getline(v:foldstart)

    " Collapses folds that start and end on braces with everything between
    " the braces replaced with {...}
    " let foldtext = line
    let foldtext = substitute( line, '\([^ \t]\)', ' \1', '')
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
        let line = getline(v:foldend)
        let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
        if endbrace == '}'
            let foldtext .= substitute( line, '^[ \t]*}\(.*\)$', ' ... }\1', 'g')
        endif
    endif


    " Compute the size of the fold
    let foldSize = v:foldend - v:foldstart + 1
    let foldSizeString = "[" . foldSize . " lines / "

    " Compute the percentage of lines represented by the fold
    let lineCount = line("$")
    let foldPercentage = printf("%5.2g", (foldSize*1.0)/lineCount*100) . "%]    "

    " Compute the width of the line number column
    let numberColWidth = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )

    " Compute the width of the fold signs column
    let foldColWidth = getwinvar( 0, '&foldcolumn' )

    " Compute expansion string
    let expansionString = repeat(" ", winwidth(0) - foldColWidth - numberColWidth - strwidth(foldtext.foldSizeString.foldPercentage) )

    return foldtext . expansionString . foldSizeString . foldPercentage
endfunction
set foldtext=MyFoldText()

" Toggle dispay whitespace
:autocmd InsertEnter,InsertLeave * set list!

" Hide cursorline in active splits
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

" Boot status line
augroup status_line_init
  autocmd!
  autocmd VimEnter * call ConfigStatusLine()
augroup END


" Post plugin load settings (Order matters)
" · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·
source $HOME/.config/nvim/keymaps.vim " Load keymaps

colorscheme onedark
set background=dark
highlight Comment cterm=italic gui=italic "Italic comments
highlight CursorLine cterm=NONE guibg=#223d6b "More visible cursor line
highlight DiffAdd guibg=#41492d
highlight DiffDelete guifg=#4b1818 guibg=#4b1818
hi Normal guibg=NONE ctermbg=NONE

set lcs=tab:»_,trail:·,eol:↵ "Display tabs, trailing whitespace and eol as...
set inccommand=split "Live substitute preview
