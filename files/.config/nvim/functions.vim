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
function! CodeFolder()
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
