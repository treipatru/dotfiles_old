"Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"

"Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim
