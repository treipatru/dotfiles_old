"Delete all buffers except the current one
command! BufOnly silent! execute "%bd|e#|bd#"

"Enable matchit(ex. use % to jump between html tags)
runtime macros/matchit.vim

"Toggle display whitespace when switching Insert mode
:autocmd InsertEnter,InsertLeave * set list!

" Start presentation mode whenever a .vpm file is loaded
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()

" Function to toggle presentation mode
function SetVimPresentationMode()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>

  if !exists('#goyo')
    Goyo
  endif
endfunction
