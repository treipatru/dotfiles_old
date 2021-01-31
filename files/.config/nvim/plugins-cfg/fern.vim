" Hide git ignored items
let g:fern_git_status#disable_ignored = 1

" On leader f toggle fern in drawer mode with current buffer selected
nnoremap <silent> <leader>f :Fern . -drawer -width=40 -toggle -reveal=%<CR>

let g:fern#default_exclude = 'node_modules\|.git\|.cache\|dist'
let g:fern#default_hidden = 1
let g:fern#renderer = "nerdfont"
