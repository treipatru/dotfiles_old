"Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"

"Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim

" Toggle git fugitive status pane
function ToggleGstatus() abort
    for l:winnr in range(1, winnr('$'))
        if !empty(getwinvar(l:winnr, 'fugitive_status'))
            execute l:winnr.'close'
        else
            vertical G
        endif
    endfor
endfunction

" Toggle git fugitive commit pane
function ToggleGCommit() abort
    for l:winnr in range(1, winnr('$'))
        if !empty(getwinvar(l:winnr, 'fugitive_status'))
            execute l:winnr.'close'
        else
            vertical Gcommit
        endif
    endfor
endfunction

" Autocommands
:autocmd InsertEnter,InsertLeave * set list! "Toggle display whitespace

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

function! ConfigStatusLine()
  lua require('plugins.cfg-bufferline')
endfunction

lua require('plugins.cfg-galaxyline')

augroup status_line_init
  autocmd!
  autocmd VimEnter * call ConfigStatusLine()
augroup END
