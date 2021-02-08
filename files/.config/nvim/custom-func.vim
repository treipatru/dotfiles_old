"Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"

"Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim

" Get git branch
function StatusBarUpdate()
    let gitoutput = split(system('git status --porcelain -b '.shellescape(expand('%')).' 2>/dev/null'),'\n')

    if len(gitoutput) > 0
        let b:gitstatus = '[' . strpart(get(gitoutput,1,'--'),0,2) . ']'
        let b:gitbranch = ' ' . system('git branch --show-current')[:-2]
    else
        let b:gitstatus = ''
        let b:gitbranch = ' ∅'
    endif

    let b:shortpath = pathshorten(expand("%:R"))
endfunc

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
autocmd BufEnter,BufWritePost * call StatusBarUpdate()
:autocmd InsertEnter,InsertLeave * set list! "Toggle display whitespace

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END
