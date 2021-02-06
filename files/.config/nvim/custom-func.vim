"Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"

"Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim

" Get git branch
function StatusBarUpdate()
    let gitoutput = split(system('git status --porcelain -b '.shellescape(expand('%')).' 2>/dev/null'),'\n')

    if len(gitoutput) > 0
        let b:gitstatus = strpart(get(gitoutput,1,'--'),0,2)
        let b:gitbranch = system('git branch --show-current')[:-2]
    else
        let b:gitstatus = '∅'
        let b:gitbranch = '∅'
    endif

    let b:shortpath = expand("%:R")
    let b:fileicon = nerdfont#find()
endfunc

" Autocommands
autocmd BufEnter,BufWritePost * call StatusBarUpdate()
:autocmd InsertEnter,InsertLeave * set list! "Toggle display whitespace
