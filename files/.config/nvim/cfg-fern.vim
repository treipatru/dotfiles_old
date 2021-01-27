" Hide git ignored items
let g:fern_git_status#disable_ignored = 1

" On leader f toggle fern in drawer mode with current buffer selected
nnoremap <silent> <leader>f :Fern . -drawer -width=40 -toggle -reveal=%<CR>
